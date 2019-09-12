From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2] fixup null q->dev checking in both block and scsi layer
Date: Thu, 12 Sep 2019 07:12:28 -0600
Message-ID: <2a285805-cdf3-fe7a-0d1a-9f53f821d025@kernel.dk>
References: <1568277328-4597-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568277328-4597-1-git-send-email-stanley.chu@mediatek.com>
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
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, martin.petersen@oracle.com, jejb@linux.ibm.com, matthias.bgg@gmail.com
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 9/12/19 2:35 AM, Stanley Chu wrote:
> Some devices may skip blk_pm_runtime_init() and have null pointer in
> its request_queue->dev. For example, SCSI devices of UFS Well-Known
> LUNs.
> 
> Currently the null pointer is checked by the user of
> blk_set_runtime_active(), i.e., scsi_dev_type_resume(). It is better
> to check it by blk_set_runtime_active() itself instead of by its
> users.

Applied, thanks.

-- 
Jens Axboe
