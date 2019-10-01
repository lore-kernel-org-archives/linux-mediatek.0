From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v4 0/3] scsi: core: allow auto suspend override by
 low-level driver
Date: Mon, 30 Sep 2019 23:01:45 -0400
Message-ID: <yq1o8z1xj6u.fsf@oracle.com>
References: <1568649411-5127-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568649411-5127-1-git-send-email-stanley.chu@mediatek.com>
 (Stanley Chu's message of "Mon, 16 Sep 2019 23:56:48 +0800")
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
Cc: sthumma@codeaurora.org, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, marc.w.gonzalez@free.fr, vivek.gautam@codeaurora.org, kernel-team@android.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, subhashj@codeaurora.org, evgreen@chromium.org, avri.altman@wdc.com, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, alim.akhtar@samsung.com, andy.teng@mediatek.com, matthias.bgg@gmail.com, beanhuo@micron.com, pedrom.sousa@synopsys.com, linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
List-Id: linux-mediatek@lists.infradead.org


Stanley,

> Until now the scsi mid-layer forbids runtime suspend till userspace
> enables it. This is mainly to quarantine some disks with broken
> runtime power management or have high latencies executing suspend
> resume callbacks. If the userspace doesn't enable the runtime suspend
> the underlying hardware will be always on even when it is not doing
> any useful work and thus wasting power.

Applied to 5.5/scsi-queue, thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
