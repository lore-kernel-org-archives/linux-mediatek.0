From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v3] scsi: ufs: fix broken hba->outstanding_tasks
Date: Thu, 29 Aug 2019 17:50:24 -0400
Message-ID: <yq17e6vsktb.fsf@oracle.com>
References: <1566222208-19890-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1566222208-19890-1-git-send-email-stanley.chu@mediatek.com>
 (Stanley Chu's message of "Mon, 19 Aug 2019 21:43:28 +0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stanley Chu <stanley.chu@mediatek.com>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, marc.w.gonzalez@free.fr, andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, evgreen@chromium.org, avri.altman@wdc.com, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com, pedrom.sousa@synopsys.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
List-Id: linux-mediatek@lists.infradead.org


Stanley,

> Currently bits in hba->outstanding_tasks are cleared only after their
> corresponding task management commands are successfully done by
> __ufshcd_issue_tm_cmd().

Applied to 5.4/scsi-queue. Thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
