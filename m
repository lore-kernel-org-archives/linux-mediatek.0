Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcpGPtXzw29rxM1+0BgBIVqFKlQ5wBr/eM3iVN1PNrE=; b=uPle5/ySl9dTUB
	IFpevh1lPUcKHMJFkm9mPy3nnE4YdtF9gVTqza8q1tokdhriAoOGeI4/1/DAefx9HtvLR6DaTTLUd
	W3dFKHuj3f5oBxEuX6BD+ID/LypJpHwoL4VxS2jmBxg5ns9hKf0Xa1RTxwUiOsQRf5GudQJnIzzgr
	PzyOs1LmTMFmZxSwaaX5/pGsFhsec/JP3iErCrZ/8x/4d2Uqc9m+xRxE+P5G1HNYXR3PYfE5Dt9Sa
	lvct37z08m5GoR0648sdTXIofMgiabiki6N0qFbKiUviBhEGl8fdZqXzaijjUfS8FyzrZAWapxxxq
	M4YjTPV/BS1SKWbsGGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7x9N-005PG4-9a; Thu, 13 Jan 2022 10:16:09 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.167])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7x99-005PDB-IN
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 10:15:57 +0000
X-KPN-MessageId: b2220258-7459-11ec-9a2e-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id b2220258-7459-11ec-9a2e-005056abbe64;
 Thu, 13 Jan 2022 11:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=gDVXsjFxRvpjVOimhsqczbSYEgs92OjIY8q3HQ0xZLo=;
 b=HBr/18+Ajg3wdobbfWiqxNHvlD5i0q1fqXDA/Hd6sXbGh1VIvyCHpK08n/9w1Gb+CSo6G3/2+QYgh
 6D7DjgaCmpgmWNmn42nFiXcnqeWwFneTX2hFv5YkafeaAN8dL5/bS7kJYqwLF8oFL5LOH/DYFC2Xaw
 z5khnE9cYoIjJOWI43E5RtaLFz99+hrR107PUMVKQcoBO0na3FMPXEDUkQMcWIBcGs658HYp913aLt
 m6IiJ6/e/+N1z5xEO4Xds2vDDKkwI7t77pHPUpFWQ7yyyhuh9s9mbSvIdLJyIvhMqWnqKIHrw38aaX
 rjz44ENw3ycdGfIor0BEqqupi6EIUCw==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|E3dVle7ORv8LVtMgyR7kL3/O5bzeh7Y0MMGEunRsfjRJEHWcSAEdfVoLox9zTgP
 iTmLz1DX0F5kFZJzXWyZNow==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id c77cf44a-7459-11ec-83ab-005056ab1411;
 Thu, 13 Jan 2022 11:15:50 +0100 (CET)
Message-ID: <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
Date: Thu, 13 Jan 2022 11:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
 <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_021556_321075_297F84AA 
X-CRM114-Status: GOOD (  14.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/01/2022 11:11, AngeloGioacchino Del Regno wrote:
> Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
>> Il 12/11/21 11:55, Yong Wu ha scritto:
>>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>>> then remove that function, use pm_runtime_disable instead.
>>>
>>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>>> rename it from the _pm to _clk.
>>>
>>> No functional change.
>>>
>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>> CC: Irui Wang <irui.wang@mediatek.com>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
> 
> Hello Yong,
> the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
> scheduled that for v5.18.
> 
> Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
> media: mtk-vcodec: *) from this series?
> 
> For the records, I think that after sending v10 this series is ready to be merged,
> as it was well reviewed and also tested on many MTK platforms.

Good to know. When I have the v10 I'll try to prioritize reviewing it and running
my usual tests.

Yong, please make sure you run 'checkpatch.pl --strict' over the v10 patches and fix
any issues (using common sense).

Regards,

	Hans

> 
> Thank you,
> - Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
