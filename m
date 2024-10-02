Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E895DCF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoDGJJC2pjwkQp7vusxBZRVD6fRN7mimcYmMWfNmhAw=; b=GIYJlZHJqJHf991smgwvICN7/B
	lwVlv48fOpLMLywWUnYjffp7Dho5vaVPkJJ/7NWuQYJAJ85YVTqpRtOK1Mux1ZqObGVOkihXcgvvl
	eXvh4feErx2ZzWqyqkLVbAa+KtA+QqkfTUW4/E2e11X/JjBZBQft8+D+cNJV9ag9IQQINXklFMWnX
	chcht1os3Q/B+ykRyi6ADg3ASJg0HKYl2WmpZmR/AhKcTFzhcVPlXHsH1FvQ5BxZ2DVLDoE7D3nQi
	4boMlBgABTziPBOaBYfLMDPtjrz4Vu6pyi1oPwLfWqgfwWcszon/TJzDwHqwOCcM+DmKL9efb8NhU
	ceJBzDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvwS-00000005NuH-4Afu;
	Wed, 02 Oct 2024 09:46:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvji-00000005Lgt-3oo9;
	Wed, 02 Oct 2024 09:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861613;
	bh=VTzA+1gkUUi2xDLP+JRBQlFWEL4kGMVHY3XG7CgyQe8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F5iDH2c641tW8Nb7C9o3px43DzLxB+c7jt9ZFNAy+j5apOXxvIuh8qj8JauZHusdf
	 A9K22V5hjrLzX282ASZldSmSwN/mc/I1J4Q7a2DB3S1wK/b8EX/LPNpWptgFZ+stZE
	 1Sp2jN0onzeUJjkm5yOermakRKV2b0dGKrVBPHmsL4+n1iO3VCBb3Krt7fKqhl3qGr
	 NZLUC0MPtxuYDCl5g51OW4Z0j5MlzcIF+Xhje+SUEt70TQOU3CukeZ8S8sJgDLQoGB
	 YwA57a8A+TGv5TX6UHF7SMhcM2PuC4EH3Ff58amwM/R8TZ5gDfRei82Y3MqWq4Cpmc
	 Yk+wJlHlgrCTg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F205017E12D3;
	Wed,  2 Oct 2024 11:33:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240911-venc-v2-1-5566c07756fd@chromium.org>
References: <20240911-venc-v2-1-5566c07756fd@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: mt8183: Add encoder node
Message-Id: <172786161293.39477.1050965471166477083.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023335_316310_53262DC0 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Sep 2024 09:07:03 +0000, Hsin-Te Yuan wrote:
> Add encoder node.
> 
> 

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mt8183: Add encoder node
      https://git.kernel.org/mediatek/c/4045f71f

Cheers,
Angelo



