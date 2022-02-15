Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46891C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjFGyxmdk9xUuNYoA7dSqp8MtD6Aru219uBv2ioNlFY=; b=0iGfW1rm54ypUy
	tU/cTiCNnVwWQcaRKq63WSTJuoArBRWj9WlutttZwGEb0Cx21bEx+eIy51IMVVCbpHb+6S+X5VdWc
	NaQ1m/ox40ro2mxwve2dQzGww6WjqDinRbfUDurSA36ZUW4b0Lf4pPcHSxGCwi+6ffkU94sT5yQoD
	qn3Bd3LiZj06Az5qLPf+RhBEeobBA2GpXeAy7ObiI/iSZ2/XI1Pj9oWAmbvpy2fglI1BG8XYssayJ
	0v3zg3TKQp67PnhfZTwvfHAtf0XbUWdL/jsVzX44n1Xz1Y/oQ2e5EbNElhrDhH42pEq1/sZhwMjj/
	e6bvmwHHqiCN8pt/t6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJvKG-002LYU-Fc; Tue, 15 Feb 2022 10:44:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJvK4-002LXX-9p; Tue, 15 Feb 2022 10:44:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E7A061F4444B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644921875;
 bh=NlOGGbbcK8ckeQdVShKWcQBqzBY0rwwlYoyGhlgbxOU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hufTTsyzxEcj+Ua3klO7EV71SdcZVFZuhS0xNNOXVIPjgUwxvPByY3+02+hbIAZCG
 aQL9crO66Y9wj2hvNJ2cGwXlPP0+1Szo0XqvznYogh0BDZVMePEVwGfUPgUcnwNot6
 R2gDb25G7fDAihTB+h2mLK7mJGD6YzuF1d02ac+hDd1fa6BXIV/c7eH26DcJPb69Y5
 rD5Tb99ORMDuu8tLT2xM8R4frjMokxj+apn1EzrDRaZtTOtl0iV+eHZEOaNoZUiQoP
 GEV8DctYvNMsaXtudrZ6ESyN9BE3QgcwaXrz96DouvRZxJMY2Yj0qm+q5q81vHx3UG
 CAS9c7QaPUgdA==
Message-ID: <c69fcd5d-a79b-ed0e-e803-63bebe987390@collabora.com>
Date: Tue, 15 Feb 2022 11:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Content-Language: en-US
To: Alyssa Rosenzweig <alyssa@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Fan <Nick.Fan@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud>
 <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
 <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
 <20220119021844.3C225C340E5@smtp.kernel.org>
 <5d839338-6072-9c52-1893-2f804d937ea1@arm.com> <YelxN/zpdkukBBqy@maud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YelxN/zpdkukBBqy@maud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_024440_577503_F7BCB9B8 
X-CRM114-Status: GOOD (  21.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/01/22 15:27, Alyssa Rosenzweig ha scritto:
>> We also already have SoC-specific GPU compatibles because even without
>> experimental interconnect easter eggs, people integrate these IPs in fairly
>> involved ways and there's a fair degree of variety. However unless we want
>> to be super-strict it's also not too hard to simply assume that if we can
>> find a "mediatek,mt8192-infracfg" syscon then we set the MT8192 magic bit
>> within it, and if we can't then we don't.
> 
> We need a MT8192-specific compatible for the GPU anyway due to "unique"
> power management requirements, this is why the MT8183 before it has a
> specific GPU compatible. So I'm not worried about the compatible.
> 

Thing is, as it was explained, this is about a unwanted SoC misconfiguration,
hence this is very specific to one SoC, which *happens to* integrate a Mali GPU.

I agree with Stephen's reasoning - also in my opinion, the panfrost driver should
be dedicated to managing the Mali GPUs and *not* the SoCs on which it is present,
so disabling the Accelerator Coherency Port for MFG should be performed inside of
files that are dealing with the specific SoC that requires this configuration (or,
if you want, quirk).

Simply put, though, as you already perfectly know, there is no driver that is
dedicated to exclusively manage the "extra" INFRA bits, so here's what I've been
thinking for a while; my logical reasoning:
- Doing it in the IOMMU driver may seem at a first glance to make some sense,
   but then, does this really have anything to do with the IOMMU? I don't think so;
- Performing the disablement in mtk-pm-domains is very shady... there's nothing
   that screams "power" in that;
- This doesn't scream "clocks" either, I understand that;
- As far as I understand this specific thing won't happen anymore (or at least,
   not in MediaTek land, but I also don't expect to see this on other SoCs).

Getting back to MediaTek-land, only MT8192 is (and will ever be) affected, from
what I understand... and there is one driver that is very specific to, targets
only, and would probe only on MT8192 - which also happens to manage the very same
iospace that we also want to poke at to disable this bit......

... clk-mt8192!

For this reason, I think that (unfortunately, to some extent) the most transparent
and cleanest approach is the one that Alyssa took, which is to perform this
set-and-forget operation there - also keeping in mind that panfrost obviously has
no way to finish probing (hence, no way to actually use the GPU device) *before*
the driver that provides clocks to it also probes and registers .. the clocks.

My personal view on this would imply that Alyssa sends a v2 of this commit that
includes MediaTek's explanation on why the ACP has to be disabled (as much as
nicely expanding the ACP acronym as a documentation effort).

I'm sorry for this wall of text (and for boring you with it! :P), but I felt like
giving an extensive personal opinion on this would've been nice.

Thank you all!
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
