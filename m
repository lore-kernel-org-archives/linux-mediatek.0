From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] staging: mt7621-dma: Use struct_size() in devm_kzalloc()
Date: Fri, 4 Jan 2019 15:30:47 -0600
Message-ID: <20190104213047.GA19391@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-mediatek@lists.infradead.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
    int stuff;
    void *entry[];
};

instance = devm_kzalloc(dev, sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = devm_kzalloc(dev, struct_size(instance, entry, count), GFP_KERNEL);

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/staging/mt7621-dma/ralink-gdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/mt7621-dma/ralink-gdma.c b/drivers/staging/mt7621-dma/ralink-gdma.c
index 792a63bd55d4..d78042eba6dd 100644
--- a/drivers/staging/mt7621-dma/ralink-gdma.c
+++ b/drivers/staging/mt7621-dma/ralink-gdma.c
@@ -821,9 +821,9 @@ static int gdma_dma_probe(struct platform_device *pdev)
 		return -EINVAL;
 	data = (struct gdma_data *) match->data;
 
-	dma_dev = devm_kzalloc(&pdev->dev, sizeof(*dma_dev) +
-			(sizeof(struct gdma_dmaengine_chan) * data->chancnt),
-			GFP_KERNEL);
+	dma_dev = devm_kzalloc(&pdev->dev,
+			       struct_size(dma_dev, chan, data->chancnt),
+			       GFP_KERNEL);
 	if (!dma_dev) {
 		dev_err(&pdev->dev, "alloc dma device failed\n");
 		return -EINVAL;
-- 
2.20.1
