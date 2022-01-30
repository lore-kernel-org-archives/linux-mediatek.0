Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC99FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nchsusPsh7jFengghQwypqLfZEYVkHK5osPCwhQRQrI=; b=OiSVGqtunBg40z
	5ynsqByeRfrvBAk1KIAIT9I4vlx4GLZW8EiPfCqhYkTpgpV4N3zj2VhOZQKyPYE+OYBMUKUuwPTJx
	iTzobZRJCrbwtkBj4zgiT7ZdeRCm0aneuLW4tgPjT47WcbLMIUVFGcJXN7dg8arXVUw1Nxro1G9fk
	Xwai+DN73te1MagfmeIcRCa+s0W7ZT6JwVd5X6uLT3fmcmwW3f6tkOTuVqc1dAYGj0gIL5UZUsP6M
	4PAKvlaziov9dfX25mOdUqNPYEcVL+ld0eevEb2ATBuQlF1ejAAiJ30akOtZ2mhGHXhdgaqdqWY9w
	TW9CUaX1D2nirazKO98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVxf-009Mzi-Dt; Mon, 31 Jan 2022 12:39:11 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nE0Bw-005pah-7s; Sun, 30 Jan 2022 02:43:50 +0000
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-01 (Coremail) with SMTP id qwCowACHJsRY+_VhYiYuAA--.39477S2;
 Sun, 30 Jan 2022 10:43:36 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: justinkb@gmail.com
Subject: Re: BUG: [PATCH v2] isoc: mediatek: Check for error clk pointer
Date: Sun, 30 Jan 2022 10:43:35 +0800
Message-Id: <20220130024335.114461-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHJsRY+_VhYiYuAA--.39477S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4xtw48uFyfJF4DCry3urg_yoW8GF15pw
 4Ig3s3tw1qgFWkKwn8A3yrKFn3Zw1rJr15Jw1rGa40yr1UWFWkAF4jyFW3uFZ7Gw4kua43
 tFZ0qF4UCas8Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUO_MaUUUUU
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_184348_731942_68B2FE6D 
X-CRM114-Status: GOOD (  14.47  )
X-Mailman-Approved-At: Mon, 31 Jan 2022 04:39:08 -0800
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gregkh@linuxfoundation.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 28, 2022 at 10:26:51PM +0800, Paul Mulders wrote:
> I guess this breaks all MT7622 SoCs since it'll prematurely exit
> init_clks (and subsequently init_scp) completely once devm_clk_get
> fails to get a reference to the mm clock producer (which happens to be
> the first one tried). This is because MT7623 has a GPU (so no mm
> clock) and MT7622 doesn't, and as a result the other clock producer
> pointers never get initialized (and other stuff in init_scp after
> returning from the error never happens).
>
> The patch seems fundamentally flawed, I guess it was either not tested
> at all, or only tested on a MT7623. The initialization functions seem
> designed with the idea that it's ok if some clocks aren't present, so
> stopping the initialization when one of them isn't present seems
> wrong. (For example, there is also a MT7622B variant of the MT7622
> which probably also lacks some clocks MT7622(A) does have).

I don't think the patch for init_clks() is flawed.
At most it is incompleted.
What it did is like fixing a potential error in the tool platform
providing service for the upper application, like what you said,
MT7623 and MT7622.
We should not keep the error in the platform because of the upper
application.
And it seems like it is MT7622 that is flawed.
The better way is to fix both the bug in init_clks() and its caller,
MT7622.

Sincerely thanks,
Jiang


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
