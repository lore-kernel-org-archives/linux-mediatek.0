From: Avri Altman <Avri.Altman@wdc.com>
Subject: RE: [PATCH v3] scsi: ufs: fix broken hba->outstanding_tasks
Date: Tue, 20 Aug 2019 06:59:20 +0000
Message-ID: <MN2PR04MB6991207C24518D8878CBAB5AFCAB0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1566222208-19890-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1566222208-19890-1-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "pedrom.sousa@synopsys.com" <pedrom.sousa@synopsys.com>
Cc: "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "andy.teng@mediatek.com" <andy.teng@mediatek.com>, "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>, "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>, "evgreen@chromium.org" <evgreen@chromium.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "peter.wang@mediatek.com" <peter.wang@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "beanhuo@micron.com" <beanhuo@micron.com>
List-Id: linux-mediatek@lists.infradead.org

> 
> Currently bits in hba->outstanding_tasks are cleared only after their
> corresponding task management commands are successfully done by
> __ufshcd_issue_tm_cmd().
> 
> If timeout happens in a task management command, its corresponding
> bit in hba->outstanding_tasks will not be cleared until next task
> management command with the same tag used successfully finishes.
> 
> This is wrong and can lead to some issues, like power issue.
> For example, ufshcd_release() and ufshcd_gate_work() will do nothing
> if hba->outstanding_tasks is not zero even if both UFS host and devices
> are actually idle.
> 
> Solution is referried from error handling of device commands: bits in
> hba->outstanding_tasks shall be cleared regardless of their execution
> results.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
