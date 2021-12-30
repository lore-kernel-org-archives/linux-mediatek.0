Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AB0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lo+pXajyci4QqYt/LUVrVPMV1MQjA9WqQzNkCERUnYg=; b=M5ektrBg+Ok7H5
	Ox1JOA8TWdruHqVvNzOguI0v+1FluHbqSe679oBK/V7CTfm2419DmL3GlLxijzt5dZUm1bp04KLkz
	xSNBlpvyuq49mAHAnK6dn8vp6pPxBt9hY6wPo7il7aaLhzTP019zxD6mWf1BnfbU55838Pnf406xs
	7MjzEtzHfnTnSBzZRe7tcClKyFRJRnA9PHuc3sKmz9ex9gtfsVWfOj+XO+YaMd0ONvfvL9E01vEy5
	oU8iivFQgEWWBanbVXHjMMoz+ao007ztVCHXq8m6NmbRvNthv4h6cQmhdZ1LyrudKSBrUczyrxNkp
	1f6n0kRTky0OrGcZ14Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2kQb-003Y1w-7A; Thu, 30 Dec 2021 01:40:25 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2kQO-003Y0a-4s; Thu, 30 Dec 2021 01:40:13 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M6UVr-1n4gEJ1hxh-006u1A; Thu, 30 Dec 2021 02:40:06 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso12552071wmk.4; 
 Wed, 29 Dec 2021 17:40:06 -0800 (PST)
X-Gm-Message-State: AOAM530Ddc1qcG7qO+UPA4svpYvyBod/M9VPU2YEbwZAl/ZKNn2L1NaS
 o1/kjGvZuDcSYLWrgVWbbfGfdI5We6j414X2zsQ=
X-Google-Smtp-Source: ABdhPJxdTKZsUGv4yK6MpMvye0fW7A+jPT6EmKT3s0X6J1Ax1eu2h7DJ+yLaT2MAqb8v3KguyWLmiC/ygBi8s75y0VA=
X-Received: by 2002:a7b:c448:: with SMTP id l8mr23776105wmi.173.1640828406019; 
 Wed, 29 Dec 2021 17:40:06 -0800 (PST)
MIME-Version: 1.0
References: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
 <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
 <9b16c1c9-7fcb-b717-7dcb-b911dd39a5a2@gmail.com>
In-Reply-To: <9b16c1c9-7fcb-b717-7dcb-b911dd39a5a2@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Dec 2021 20:40:03 -0500
X-Gmail-Original-Message-ID: <CAK8P3a2mY7y1XWS6L-Ze-DtnhONJRzx0rFdAagBfKGBErsdD6Q@mail.gmail.com>
Message-ID: <CAK8P3a2mY7y1XWS6L-Ze-DtnhONJRzx0rFdAagBfKGBErsdD6Q@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: updates for v5.17
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <mbrugger@suse.com>,
 arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ben Tseng <ben.tseng@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Prashant Malani <pmalani@chromium.org>, 
 Sam Shih <sam.shih@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
X-Provags-ID: V03:K1:+M+sIdTmVT+7BGwywMiI3gaLZxBZi96+nu6gkSBzw3gfWWQwrY5
 p8nmhrn1FxsJtx3gMhy23O3wfZ72t2PwlcotOijXBmgCrJpQAOJsLGuAPxLTq3c0kBZzW0W
 r5UW5DJn3tiYLXJZfQY9VO2rykkT/darN8XYlpZGhQ2cW7+hYDBxWTcMuQ0sp3a0DUV/rxn
 Mph50rBo4jpMZAVJ0opUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iaVZ8yiaTIE=:9HOw5IkwSY170rxUxpn3Tr
 mLcZcPjpBOvGMS4hqIdKXz6mfEc9llS4wvOiqTkDA8OKMKGlO/DSgiwOFDfKqB/4T9YnteMsm
 awt3i/YSFaSvx1C97GlmIIvqcgqnf5SxRz5bx9or1qM0OgmTGgsVkUD2QDVLh0y/+bDyJ1dBc
 EJKgXgOet/KaHgNCPRGZZCmnk8KvE5Am5j6f0lnj5IAXR2365RTMQU4jh0G5EDHJsDGC+DmG0
 c1CCI6xn+apzuGZ9x9xfrTjHWDRGBqxgqqSBP0OVTlV7B6FuZNdfBBswFWEigHXPMAMPZzG1Z
 kdOuEhZUqW96cL+EX66sJVbVqNVDaO4d90frBXYyEz4XJ1e1DLB5BcHwkyPByUbmCGUaFH3EH
 Zbjt1Pz0xMDAcmtJkV2DasDAnk2WZ5Ob8W4D2olmY5s2u8e8+k6FgSDBKUuCpzzfEtopoWdDd
 VzGTtq9O4B1rVcIGJOhRuWPjDeje+45QccLy2wirK9Ph3ScEJJH0f6t4rgGwf9rITcHXzxkSn
 rtk6IZSWgH65dkKhT3VW7VebC3GBGn2kIGb4wOgqspBm8X1vh3YCXjokaUatYv+aKxJ9xC37E
 tl5kNLuRaz4gD9I8avn4/DNWYuGuRT7Cu8A4+ZHWIEYZxgyXi80WHVWDkOFU9exWsbH84P/Sn
 IlH8+w2E37dNq+1ksViHKcFwhEOU8h7+zxgVvN/cr0NSW8+QK75CtjzKZk+zRsuGu7h8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_174012_546622_27DC58E6 
X-CRM114-Status: GOOD (  30.20  )
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

On Wed, Dec 29, 2021 at 10:29 AM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> On 20/12/2021 17:18, Arnd Bergmann wrote:
> > On Sat, Dec 18, 2021 at 9:42 AM Matthias Brugger <mbrugger@suse.com> wrote:
> >>
> >> Please take a look on the below patches for aarch64 based MediaTek boards.
> >> In this round we add support for the mt8183 based Acer Crhomebook 314, as well
> >> as we add support to several SKUs for mt8183 based Chromebooks.
> >> Apart from that we add basic support to the mt7986 in both variants (mt7986a,
> >> mt7986b). The difference between the both SoCs are the pin-controller capabilities.
> >>
> >> Hope you are fine with this pull request.
> >
> > I've pulled both tags, but I have two minor comments:
> >
> > - please put "mediatek" into the subject, that helps when looking at
> > the pull requests
> >    with pwclient, which does not show the author by default
> >
>
> I did this pull request with a lot of time pressure and forgot about it. My
> apologies, I'll try to not forget next time.
>
> > - I was expecting you to send a branch for the new EN7523 SoC as well. Did that
> >    end up not making it in time?
> >
>
> As I have seen, in the meantime you reviewed some parts yourself. I took the
> first two patches in my tree, but we should coordinate for the rest. If  you
> want to take it through the SOC tree or if I should take it through the mediatek
> tree. As Airoha is a subsidiary of MediaTek, I suppose in the long run, you want
> it do be part of the Mediatek tree, correct?

I talked to Felix about it last week, I think it would be best if you handle the
arch/{arm,arm64}/ bits for Airoha as part of the mach-mediatek and merge
changes the same way as the mt76xx, mt69xx and mt81xx series. For the
initial submission, of en7623, having a single branch that contains both
the arch/* and drivers/* with the appropriate Acks would make the most
sense, to avoid spreading it out over multiple merge windows, though it's
not too late for 5.17.

         Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
