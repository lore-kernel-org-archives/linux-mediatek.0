Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bOg9KUhQd8lvjBNSGfp/2rsDjrRCVgLPxqPWikywek=; b=FIIlFcFuoo+NA/
	zLho4m/thgdnF5xpBg/zhPA+nqD/6NAMo3qn39XiHQdbTL2/XH08jO/0uAfEHREqa2/Vy+N9jAD7d
	QdPevqacWrmAQrdo/gE1Cp2CdbOhb0mXAKQmZCpN2yAiqTUVSFTztlEbYlQqW6Mslb44r/371sfa3
	u176VXnjWBfee/Pks5gF7CJmLG27hcDRIQ58onL+vOIptti/bHLK7+jfZXC58Wr5ffk/tZpoJt0ug
	q4qgAdOBXIMacMN681J9kWA6tPiKKVmb/sTbZJ9LUBk/6kYHoind1lQzpmnyHSxTCVXGtAQ8l3SZW
	VYuqdw7q2gNB7pV3qBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKoVn-00CIup-8J; Thu, 17 Feb 2022 21:40:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKoVa-00CIsT-RF; Thu, 17 Feb 2022 21:40:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5127F60ADF;
 Thu, 17 Feb 2022 21:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3523C340E8;
 Thu, 17 Feb 2022 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645134013;
 bh=zPrhX6k02e96zl7KllkvOgDxEiUJZNdS53PBR6YrUdw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OQmR4QkM056D63THM2zznP9VUiTMw4cIvoMui4+aPVzMoiL+2BP7DplXcsBuRDE/0
 IoBzs1LG82niyUTLVQ/hE/3JTpVY7FynZg1WCUCI0Ln8FE7Uv9KInyEtpQWAfLV0H/
 EkmYY64GEZBWYLV6nKcn4yiVjRn4uqf4BXIaKGMHNRVIqxIYGrIO0dMT/KrD+ZXop/
 CW8f6ChbfZoc1j+C8T5hYXcD4Qc/SYfPetO+qaDPxKK6H/b4XqvQ5FRoJRKxNF92+h
 9JeV8PeytMbDbiEjo3AAUG+zTMHTxdYMwK9W/umZfdciSC7tEDuxdDuSoNPMsxXCJ0
 CuBUejYjFXeOg==
MIME-Version: 1.0
In-Reply-To: <9f05238c-4649-0673-21eb-7b7562d0d5c1@arm.com>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud>
 <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
 <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
 <20220119021844.3C225C340E5@smtp.kernel.org>
 <5d839338-6072-9c52-1893-2f804d937ea1@arm.com> <YelxN/zpdkukBBqy@maud>
 <c69fcd5d-a79b-ed0e-e803-63bebe987390@collabora.com>
 <9f05238c-4649-0673-21eb-7b7562d0d5c1@arm.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
From: Stephen Boyd <sboyd@kernel.org>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Nick Fan <Nick.Fan@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>
To: Alyssa Rosenzweig <alyssa@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Date: Thu, 17 Feb 2022 13:40:11 -0800
User-Agent: alot/0.10
Message-Id: <20220217214013.A3523C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_134014_937671_6AA5B392 
X-CRM114-Status: GOOD (  10.54  )
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

Quoting Robin Murphy (2022-02-15 07:21:52)
> On 2022-02-15 10:44, AngeloGioacchino Del Regno wrote:
> 
> All in all this has now convinced me that it *is* worth the slight extra
> effort to put random infracfg stuff in the random infracfg stuff place.
> And by "slight" I mean it turns out I've spent longer writing this prose
> than bashing out the illustrative diff below, which is the last opinion
> I shall have on this matter. Feel free to take it and fix it, or do 
> anything else if you prefer :)
> 
> Cheers,
> Robin.
> 

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
