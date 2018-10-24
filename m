From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] staging: mt7621-dma: Add braces around else branches
Date: Wed, 24 Oct 2018 12:45:44 +0200
Message-ID: <af4594cc-05c0-672c-d560-b50705ceaab3@gmail.com>
References: <20181023211142.GA2661@v> <20181024045653.GA2864@v>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181024045653.GA2864@v>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Kimberly Brown <kimbrownkd@gmail.com>, outreachy-kernel@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, linux-mediatek@lists.infradead.org, NeilBrown <neil@brown.name>, =?UTF-8?Q?Christian_L=c3=bctke-Stetzkamp?= <christian@lkamp.de>, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Kiberly,

Thanks for adding all the emails in CC.
I would encourage you for your next patch to distinguish between CC and TO.
You should send your patch TO important maintainers in the get_maintainers.pl
list (as default, to all of them). If there is someone you really want to look
into the patch, then add him/her in TO as well.

Put the rest (people and mailing lists) in CC. Why? Some people filter their
mails so that they can concentrate on the mails they got send directly and look
on mails they are in CC with lower priority (maybe not at all, because there are
too much?). So it is important to have the maintainers in the TO list and not in CC.

Keep up the good work :)
Matthias

On 24/10/2018 06:56, Kimberly Brown wrote:
> Add braces around else branches in conditional statements that include
> branches with multiple statements. This style complies with the Linux
> kernel coding style and improves consistency and readability. Issues found by
> checkpatch.
> 
> Signed-off-by: Kimberly Brown <kimbrownkd@gmail.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> Changes in v2:
> - Added people and mailing lists from get_maintainer.pl to the CC list
> - Added Reviewed-by line
> 
>  drivers/staging/mt7621-dma/mtk-hsdma.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
> index df6ebf41bdea..35556f024aa1 100644
> --- a/drivers/staging/mt7621-dma/mtk-hsdma.c
> +++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
> @@ -418,8 +418,9 @@ static void mtk_hsdma_chan_done(struct mtk_hsdam_engine *hsdma,
>  			vchan_cookie_complete(&desc->vdesc);
>  			chan_issued = gdma_next_desc(chan);
>  		}
> -	} else
> +	} else {
>  		dev_dbg(hsdma->ddev.dev, "no desc to complete\n");
> +	}
>  
>  	if (chan_issued)
>  		set_bit(chan->id, &hsdma->chan_issued);
> @@ -456,8 +457,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
>  		if (gdma_next_desc(chan)) {
>  			set_bit(chan->id, &hsdma->chan_issued);
>  			tasklet_schedule(&hsdma->task);
> -		} else
> +		} else {
>  			dev_dbg(hsdma->ddev.dev, "no desc to issue\n");
> +		}
>  	}
>  	spin_unlock_bh(&chan->vchan.lock);
>  }
> 
