Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889EAC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 07:27:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0382B61178
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 07:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0382B61178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O0u/YN9V07qwv7XCLXdxNI755XIVmNDD0mURgaca4Ww=; b=jkQYIccbPJkdh3uJAb4plJINx
	B3+3WkNA8yUBcAJtjwWr4OD2C1byTU8DSTb5r0PVDEa/PRyDytu+ED+4grzCbffajyXbmSYLM2PND
	GCTAlMyzEy61la3N/1FpvY/aN5Qmi+Acw5jCy6e5jPjGTI/zmhOlNoZa8LBLtBW6b67cBxfkD7QCC
	Zs4T7dRZ85ZhDh5a+0sV940hpquwqssqQ0YYMY0RSwwR23cujJLhxeXWCUw2jArBcI3qxf/zcLTjS
	rTcMnoWSgnWG0YKFRo9BV63FDKKKFqIIaYy5MRl6tXfgaUpXhB7Ge3b9W50F3DUIc58QQlSMw7hH0
	vPxEmRz5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUP4L-007DXz-Ut; Thu, 08 Apr 2021 07:27:17 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUP3x-007DPE-Cw; Thu, 08 Apr 2021 07:26:51 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXotA-1l58Qm0C5M-00YDZh; Thu, 08 Apr 2021 09:26:48 +0200
Received: by mail-oo1-f47.google.com with SMTP id
 n12-20020a4ad12c0000b02901b63e7bc1b4so283328oor.5; 
 Thu, 08 Apr 2021 00:26:47 -0700 (PDT)
X-Gm-Message-State: AOAM531MSgt0amp/mLmUdh7TaP5SaEagIlfL5ae+faxs2wTu9Q0Jdhii
 E+NgeBakUSVwsMeLkyXVEZMMI96nUHEgRYh2O0Q=
X-Google-Smtp-Source: ABdhPJzKJmULiKJZbqIfF2zDxr9Dn4RUKtO26qlLbMKJT/5DsJBNPIXmgMgdVr4n60mmoqzCYdBdCT5pE1al5gbKDF0=
X-Received: by 2002:a4a:244d:: with SMTP id v13mr6446430oov.66.1617866806386; 
 Thu, 08 Apr 2021 00:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
 <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
 <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com>
 <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
 <CAOwMV_yQLWwMEQ_f_wHOAipgD1qZgNz2SA2RJDZpNozCKv4vWQ@mail.gmail.com>
In-Reply-To: <CAOwMV_yQLWwMEQ_f_wHOAipgD1qZgNz2SA2RJDZpNozCKv4vWQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 09:26:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Qg-uz0kMXFMrvRjUv3NRvZXjTwS1P5MDvFk3feYaBzg@mail.gmail.com>
Message-ID: <CAK8P3a2Qg-uz0kMXFMrvRjUv3NRvZXjTwS1P5MDvFk3feYaBzg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
To: Fabien Parent <fparent@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Irui Wang <irui.wang@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Provags-ID: V03:K1:3iJ3FwKfbPdKycmovsr0K6C4Gkm66iqPcSy1F0MH+JIfgtd9avP
 LRv4ArBQ4ueRRleO8vtmT4rEBShBdVdHvE/P3puzDhocO8ssb0TTZ4fQk8TSP+rog826w87
 WdsYiVgATAkCNRjcaBj71Fkvy6sjWlSimuNOwuated02Fyn1udh58kBfv40qafz7rHqIj33
 bXncLb3MaOEIXrN6MzGkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gjunnoIs9bs=:15FKe2y5vIh6o3CwAYJr5h
 8ibi2v3g5okh4US5CipbjIoV1w9woIMNno5HSMZDH42TXeZyXZsq00F09tDA8lHTfX5B0kz8c
 F/RftUI8QLCJiehAIYx1maDUcybJU5aMmY101bX8J32XNZOlOzMifWD6oOpYUKN/T9JYRQGpc
 /ZLtsvWFXer9uuWjQ4kNlmrjqW0jv8ktaL4BAVYwiWPHLCrR1C1bvRQT+c6mj257cWwR9K9eZ
 ZqoDK7cVQnEMHvD/+Qhv8SV3+gsq12p0YEO8Coouy+gcx9Rm4sIFHKrTyhlpdaav+lKwI9o2Z
 4qbg+5vzsoKonnbc/4UU7fk0nuKKBRbZ1l8o5EJhuoQx/c2Kz3Zxsm/QDW2EBhiup7J9HvcGs
 3vwLHmkP2OCYfqfmrfZ8s55wGftLAesZK3BPVjeU7RiWkqDh9STiXCdyu1v6mvbTK/MuNrcNZ
 Li1CibN+I2rDKa5q41lj0swIe8QztNo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_082649_783867_923B9724 
X-CRM114-Status: GOOD (  23.09  )
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

On Thu, Apr 8, 2021 at 12:14 AM Fabien Parent <fparent@baylibre.com> wrote:
> On Wed, Apr 7, 2021 at 7:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wed, Apr 7, 2021 at 6:34 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > > On 07/04/2021 18:06, Arnd Bergmann wrote:
> >
> > So five of the strings are documented, the others are missing. I did not check
> > the other patches in your branch.
>
> The binding documentation for these drivers are here [0]. The display
> bindings are documented as:
> - compatible: "mediatek,<chip>-disp-<function>", one of
>
> The <chip> placeholder is never expanded for all the supported chips.
> The 5 existings matches from your grep command comes from the example.
> I guess these will be fixed whenever someone converts [0] to yaml.

Ok. I suppose the wildcards just didn't get caught in the initial review of the
binding. The way the binding is defined is not all that helpful since the entire
point of having chip specific strings is to allow having different bindings for
future chips that have different requirements.

There is still an open question on what to do to replace the aliases. At least
since they are not part of the documented binding, it is fairly easy to argue
that the drivers should not rely on them, and we can still change them.
I also see that as late as last november, there were still incompatible
code changes to the ad-hoc binding in
drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c, so I'm not too worried
about breaking existing dts files that relied on it.

I don't claim to understand how the various blocks all fit together here,
but I would expect that this can all be replaced with just having
references to phandles for the other nodes in one place.

Are the aliases in this case actually board specific, or do they just
document how the SoC is wired up?

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
