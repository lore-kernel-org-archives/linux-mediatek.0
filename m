From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] mmc: mediatek: Use data tune for CMD line tune
Date: Mon, 3 Apr 2017 17:34:42 +0300
Message-ID: <20170403143442.GA23053@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: yong.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

[  You didn't really add this but since you touched it maybe that means
   you know how to silence this static checker warning?  - dan ]

Hello yong mao,

The patch a768529d73a1: "mmc: mediatek: Use data tune for CMD line
tune" from Mar 15, 2017, leads to the following static checker
warning:

	drivers/mmc/host/mtk-sd.c:1466 hs400_tune_response()
	error: uninitialized symbol 'cmd_err'.

drivers/mmc/host/mtk-sd.c
  1456          for (i = 0 ; i < PAD_DELAY_MAX; i++) {
  1457                  sdr_set_field(host->base + PAD_CMD_TUNE,
  1458                                PAD_CMD_TUNE_RX_DLY3, i);
  1459                  /*
  1460                   * Using the same parameters, it may sometimes pass the test,
  1461                   * but sometimes it may fail. To make sure the parameters are
  1462                   * more stable, we test each set of parameters 3 times.
  1463                   */
  1464                  for (j = 0; j < 3; j++) {
  1465                          mmc_send_tuning(mmc, opcode, &cmd_err);
                                                              ^^^^^^^
If kzalloc() fails then cmd_err isn't initialized.  We could probably
check for errors here?

  1466                          if (!cmd_err) {
  1467                                  cmd_delay |= (1 << i);
  1468                          } else {
  1469                                  cmd_delay &= ~(1 << i);
  1470                                  break;
  1471                          }
  1472                  }
  1473          }

regards,
dan carpenter
