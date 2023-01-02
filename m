Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13565C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpbWVZRvg9AIaDGOnq/ekC2NRAjd/w9USYSz4UospIY=; b=cV3wyoK5WpxhE3ySnCkSjEUmHa
	4GQrYojQvSZ1Af6hBEKtV0lmYo0CWhoFdGEy2P5y4dB6KhvPe+spw3+PMeTPHsGuA6Tc4hkQsLAK2
	SDwXwBt3hXqRnYoE+KCGgDodcLgnLyryUlgx4PNmF7KSumM5f20Ss7vZm8a9vA2VzxHl43e0cd+2s
	LRzbygftjAZVLZC8WLXyU1mEkq/bVLlBjugTjRBFNLCsOwNcaVImL3W1uLibq5Wi5FqLWDU4nh950
	SvuNrU4m4QjvmGipnvg57XFAQyGHKNTy8S8Y871rJVHENPWgFHuSpvDBL9seAjo0dZ/lBTv/wUVvs
	C2uII6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCSxz-00EWkR-5m; Mon, 02 Jan 2023 22:07:35 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCSwS-00EWIb-F0
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 22:06:10 +0000
Received: by mail-ej1-x632.google.com with SMTP id ud5so69398974ejc.4
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 14:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpbWVZRvg9AIaDGOnq/ekC2NRAjd/w9USYSz4UospIY=;
        b=k0Gmyge4hyss3aSEfDDLRNsqrAQWde5Xg5/pFFIVKkqDzEciPYZLwk0hQ2BxMIhkqG
         Ascjm2X3ua2QpN8PGSjpxo89BdR7pkCglq1djyHt4BmXV++UmIurvQNsh10//IdRWJ6U
         /QUuSR7PgMdIACOgMRh2jL4fI2UHMXX6t1K+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpbWVZRvg9AIaDGOnq/ekC2NRAjd/w9USYSz4UospIY=;
        b=tdSzc4k6V3cPoH+TutkwzpnLDn+Y19YRoKrnCfUguIW20NRUzTApteDlhJzHuwOyJs
         x2aa48UlrDQcAW8TmcD5VuVDN1pixQXCG+j8/h3fx31idHb8On5v5y/xRpvyk2itIjQ3
         g+jWCn0WqDLi69NP9MKH3oUzSuZzJfWq3TXro63PX2KIiK7u8FALNjf86kX9Q4kXcnRR
         1ZXeRs1atFRfHzdtEgcxG1PUGwDrcX9hiwh65E+AOQt2UoSI47TsQjk6SWd0U2A9ePVL
         Ff/l5IYahOnd9oFpvkdvzLbjPj7JwoXgl8HrYxmURaiHjOJSgisnJs5V3PeBnWw2CYaI
         wAiQ==
X-Gm-Message-State: AFqh2krhjLRMByqjwpsaQxlvKJkT/2PM+u2XnV6vYyaam7f64EYzS+h8
	yWlP06vABe2bC+u39KU/C2POIYPP/a5wL9Y+tI5rJg==
X-Google-Smtp-Source: AMrXdXtyf9qByEQ1daXTlW+37rKOM447IPDhQSC085lEdRfvDdD0vPXi1FyRL6R+s4y0WRMydaDPVRc7nHyFllOp2sc=
X-Received: by 2002:a17:906:1153:b0:7ff:796b:93ee with SMTP id
 i19-20020a170906115300b007ff796b93eemr4918125eja.582.1672697157182; Mon, 02
 Jan 2023 14:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20221208072520.26210-1-peter.wang@mediatek.com>
 <yq14jtyekv2.fsf@ca-mkp.ca.oracle.com> <CAONX=-d-LZSV9-R=oLDFKsBG8Zd90wXOcGR44kPaorDH-Y7MnQ@mail.gmail.com>
 <35850d1c8f042d59f14f268502aa30ac497b2d5e.camel@mediatek.com>
In-Reply-To: <35850d1c8f042d59f14f268502aa30ac497b2d5e.camel@mediatek.com>
From: Daniil Lunev <dlunev@chromium.org>
Date: Tue, 3 Jan 2023 09:05:46 +1100
Message-ID: <CAONX=-frZnh054ORgp=NB-CM1ZkBM7+ea51rsSjeZS3SBLKdGg@mail.gmail.com>
Subject: Re: [PATCH v6] ufs: core: wlun suspend SSU/enter hibern8 fail recovery
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
Cc: "martin.petersen@oracle.com" <martin.petersen@oracle.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>, 
	=?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>, 
	=?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, 
	=?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>, 
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, wsd_upstream <wsd_upstream@mediatek.com>, 
	"avri.altman@wdc.com" <avri.altman@wdc.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	=?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>, 
	=?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>, 
	=?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?= <Chaotian.Jing@mediatek.com>, 
	=?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?= <Powen.Kao@mediatek.com>, 
	=?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>, 
	=?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?= <Qilin.Tan@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_140600_863313_8BC23FA0 
X-CRM114-Status: GOOD (  12.91  )
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

On Wed, Dec 21, 2022 at 4:59 PM Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B)
<peter.wang@mediatek.com> wrote:
> But if without this patch when purge is onging, system IO will hang,
> this is no better.
Yes, that is why I am just pointing this out as a matter of fact, not as a =
bug.
It is arguable if resetting the controller in the deadlock situation is a p=
roper
thing to do, but it might be the next best thing, so I don't argue that nei=
ther.

> So, with current design, if purge initiator do not want to see rpm
> EBUSY, then he should polling bPurgeStatus.
> What do you think?

I am actually not sure if management operations extend the timeout - they a=
re
going through bsg interface, and I am not sure it properly re-sets the time=
outs
on all possible nexus interfaces, need to check that.
But even if it does, there are two problems:
* If you make kernel be polling that parameter - it will actually make the
  application level to miss the completion code (since after querying
  completion once it will return Not Started afterwards).
* And application polling is race prone. We set runtime suspend to 100ms - =
so
  depending on the scheduling quirks it may miss the event.

--Daniil

