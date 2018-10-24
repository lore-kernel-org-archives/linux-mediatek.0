From: Kimberly Brown <kimbrownkd@gmail.com>
Subject: [PATCH v2] staging: mt7621-dma: Add braces around else branches
Date: Wed, 24 Oct 2018 00:56:53 -0400
Message-ID: <20181024045653.GA2864@v>
References: <20181023211142.GA2661@v>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20181023211142.GA2661@v>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: outreachy-kernel@googlegroups.com
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, linux-mediatek@lists.infradead.org, Kimberly Brown <kimbrownkd@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Christian =?iso-8859-1?Q?L=FCtke-Stetzkamp?= <christian@lkamp.de>, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

Add braces around else branches in conditional statements that include
branches with multiple statements. This style complies with the Linux
kernel coding style and improves consistency and readability. Issues found by
checkpatch.

Signed-off-by: Kimberly Brown <kimbrownkd@gmail.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
Changes in v2:
- Added people and mailing lists from get_maintainer.pl to the CC list
- Added Reviewed-by line

 drivers/staging/mt7621-dma/mtk-hsdma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index df6ebf41bdea..35556f024aa1 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -418,8 +418,9 @@ static void mtk_hsdma_chan_done(struct mtk_hsdam_engine *hsdma,
 			vchan_cookie_complete(&desc->vdesc);
 			chan_issued = gdma_next_desc(chan);
 		}
-	} else
+	} else {
 		dev_dbg(hsdma->ddev.dev, "no desc to complete\n");
+	}
 
 	if (chan_issued)
 		set_bit(chan->id, &hsdma->chan_issued);
@@ -456,8 +457,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
 		if (gdma_next_desc(chan)) {
 			set_bit(chan->id, &hsdma->chan_issued);
 			tasklet_schedule(&hsdma->task);
-		} else
+		} else {
 			dev_dbg(hsdma->ddev.dev, "no desc to issue\n");
+		}
 	}
 	spin_unlock_bh(&chan->vchan.lock);
 }
-- 
2.17.1
