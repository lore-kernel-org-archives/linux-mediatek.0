From: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH v1] ubifs: support page statistics in vmstat
Date: Sun, 21 Jul 2019 22:15:55 +0200
Message-ID: <CAFLxGvwLTTN+S=Bd0gZWKJbjvanCe_HV_dfmoZzyb1hzWkkGpQ@mail.gmail.com>
References: <1563451437-15725-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1563451437-15725-1-git-send-email-stanley.chu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Stanley Chu <stanley.chu@mediatek.com>
Cc: linger.lee@mediatek.com, Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>, kuohong.wang@mediatek.com, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org, chienwei.chang@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jul 18, 2019 at 2:04 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> Currently PGPGIN and PGPGOUT statistics in vmstat is only
> hooked in submit_bio() for block device I/O path.
>
> This patch adds this feature for ubifs as well.

While I think updating these counter for raw flash makes sense,
I wonder whether UBIFS is the right layer.
Why not directly in MTD or at least UBI?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
