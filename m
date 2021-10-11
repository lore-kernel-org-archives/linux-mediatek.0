Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E92C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 20:35:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AC4D60F22
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 20:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AC4D60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BMlyfnvE41cGRO5GUOiq/1H3d1mAPlBhIAnsJQBDrA=; b=fh3k2Kelct7qtk
	asbM2LhXkbzx79IjlPjTH9NGwVSpXlg0C6e5isA4FPIt4ZO2JrOjGSL7ffI9p4NSWFLMqjIaIl1rS
	ougRPWzpWTpE0Z9zPfJNGanAM46CEardZKDbvX+TnyE89KqGKyfVRlCK1UzNCMAs3gZqGUzvf1v6B
	VBv4RoDLmOf8+CaCPrVmDTNnq+EQ0NlWcjxBrCCLNwsxbzs8iTNtAf1YPD23xkwcKHhaOTunLCqeI
	HAhbXEMo69qGl6ZTJowmo08MRxaTNJKVGXMJX0ht+ZDfxh7a/vTyJQD+EaGFWVsIzI8J5oqvkGhTR
	PywP5NbwrfQ1bRUtvfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma20r-00AbsW-Rr; Mon, 11 Oct 2021 20:35:09 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma20o-00AbrW-9f; Mon, 11 Oct 2021 20:35:07 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M1ZUb-1md2on3tLn-0032eT; Mon, 11 Oct 2021 22:35:02 +0200
Received: by mail-wr1-f46.google.com with SMTP id o20so59726497wro.3;
 Mon, 11 Oct 2021 13:35:02 -0700 (PDT)
X-Gm-Message-State: AOAM5313d+2wq8ZiGcyypkDIlyZBHGxwAucWAHG3ZUiQhtHutL2ri3gq
 gxNEwmCqubePvcBcD8QzuuLgJzrUqjhMDIg8vwM=
X-Google-Smtp-Source: ABdhPJx1wv+/ttFg8R4RChMinfeT7b//HX1BFbtzP0lK46YNi2vSxuV3p6bdSOkKi7UXRbaumdbBbEZ7F9jL4U0kXhQ=
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr1181367wmi.173.1633984502286; 
 Mon, 11 Oct 2021 13:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
In-Reply-To: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Oct 2021 22:34:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a06SKo+Y+DiFpozrO0R+67ht1ad6U9dyTa-M9TtD73VcQ@mail.gmail.com>
Message-ID: <CAK8P3a06SKo+Y+DiFpozrO0R+67ht1ad6U9dyTa-M9TtD73VcQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts64: mediatek updates for v5.16
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Kansho Nishida <kansho@chromium.org>
X-Provags-ID: V03:K1:8t/gLvq9ZJKZ/zVCUWIjXktv4vO911So+/Gb319eBmQH3jlrY8+
 /OZjkyunQU7TeO5hr2IgAajZIijiObBr1zKqymiArJ0MiteFeygSs8Apvx/YBM/66CYMs9g
 jV+cmSlN2Q/zEfkwpHTG8V/uhDNetdRpvPfFtr0P46igr2MEtDSxGN7kFDzDZ/NEsO+Jb7r
 S0AmdJiKxZtRmaE7w8+YQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yj+BYAWQtKk=:TjpfHNWQzfHO5buRdCsEUr
 J3mitA+vwdziye2mWFBzCoh2yN1CGUMUs1fYRoLnYq44l9odh+fVsc5TckXufHoHa1ZgA39Ro
 im/UoLS+bgcNOJPKV1wCh/LgycZbpMoMMoOJoeulv5IrfPC45qtBSUVOEIY4rmBaKPO5BnKL+
 6Xl7aZ3bi9CWzivKP5ufvYM7RnKWkMVm4OYijlEmlAdZ1jIu35F20J2Ni24HrsUecywhw8WYR
 l+p1K8NJVqaZltHOwFURAVbIATW2hzCjJ0zfuf6AOoJ81Z7CXfx/n6P6u+Bo5VHt2YywIquJ5
 hK3zPIWw18pUiUGMBm0fHMUm5s5Ev8nS1KtZ5hlakjgHF9gd355QnuZe/Bcq1hdcsNetgB0gi
 14pFi70nvlR511kkkba2XSv2ra2N/QTGZ2K8aQmujof0gp5Za0v/r8OMoj3yaTvZGQfT8jLEs
 APomXI8fvy/rHqiOGprY1N0KxuEYLJLyzujPiPXMZgzuZTFJtmy1Yzu2ROu+hZf2gdtPeON9B
 buD9wqty94rg1pXqB+46vp7N3xdfsynKNWIQVooqwRHoc2/Ix+p3kvrBdwavcySLtXcml5oEv
 061ufjYtwQ+M9/VLuOTvRXUOrXpFLSBRKEJxHxgVmMMaOO/9FDPJI8qNNTs52FEiKHqFOmvT+
 5YFK0up8akuDciS2aD4/hN7FX6rCmPXXnmHw9bu+al7fh078NgxRJzgHuIzwC7Yqqp2fc+Nht
 OYjXzplw76i7SyS+VrxJ5Hrw/DBsEFdr6cOAgTFU2moDEZAxtNSjrO/EIMPKRXeAdBD8L3h6R
 TF0ep3M9R4tW64QaFr5Td41p6aX8nOfJFhmuPCxmRerjBuTs0SImj5g2h8p+fTRPb3HAiPARL
 n8vFmmagPCzp3dUqNg+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_133506_663807_878AADD8 
X-CRM114-Status: GOOD (  16.94  )
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

On Mon, Oct 11, 2021 at 11:58 AM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi Arnd and Olof,
>
> Here come the latest updates for arm64 DTS cahgnes.
> Biggest change is, that we have now support for a reset controller inside the
> mmsys. This goes inhand with changes to the driver, that you will find in the
> soc pull request.
>
>
>    arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0 (2021-10-08
> 15:11:14 +0200)
>
> ----------------------------------------------------------------
> - mt8173: add reset for dsi0 to mmsys
> - move dt-bindings reset controller includes to correct folder
> - split PCIe node to use new format for mt2712 and mt7622
> - mt8183: add audio node to chromebook devices
> - mt8192: add clock controller node

I skipped this one for now, need some clarification. The PCIe node
looks like you are doing an incompatible change to the DT binding,
but that is something that should be explained in the tag description
or (ideally) avoided if at all possible.

Did I misread that patch, or did you forget about it here?

On a related note, the tag description should better have full
sentences like your introductory text above it, that makes for
a better changelog text in the end. Enumerating all the changes
is not helpful here because the list of commits is also part of
the changeset description after I commit it.

          Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
