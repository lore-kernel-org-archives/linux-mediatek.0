Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0507DCCA47B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaQ8+XxDMsyg39E/X/olrr5C+3hmd5ALGJt6H2NUtg0=; b=PYDy13HMYdCriO+fHIwpBC+wEe
	0m6meXiIsa1dVdm96I/0NQMEKfjR81NUvILM2WkwAML2oE2JNGpIh3X1n78zrxJVk98EKByuTPtMC
	fDv76R/e+/u/l5ENWB7M248vxaIMfX+ZLAIjw0Gl28K1XNz5fsbDkvLq78S/2AHB+WNtAW4M0cmU6
	f4b1B/ssLdl+mnF9BhJqlHTilsKiuN2cTJpVf0Z6Fl+qKm1qNGWeessL78RrgIdukx02Bpq5wKyxp
	eyq3XYJtexO0Exym++FJtAjQkQUj9X/xizm2yfWIOCOTjqo9qljD5GCWyNTeuPzOt1APDSNduWRJu
	BdfUgyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8kWJ-001AVc-Hk; Tue, 05 Jul 2022 15:31:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8kVw-001AO2-4g; Tue, 05 Jul 2022 15:31:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1BFCB8181B;
	Tue,  5 Jul 2022 15:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FEEC341CB;
	Tue,  5 Jul 2022 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657035057;
	bh=kUXDpKKltU2E5XUxKJ1iBTwK6bfrdSF41IJcNKUY8N4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JSoVp6BTXh4v7n0Wnh2VXbZB8n9X7b5Xy0LEmQ8gNpehQr9/79HxzAzTH0aCoKD4o
	 MMRlD9ojcMDadWox6EJTR43LTzLmAW9czCVB8FpoLrjCIQ2cIgEJox1X2fKDZrjojE
	 z7wT0psCAWYc8bipXq5GGpwKW1Lim3W1aBPAtT1u5cJARTrJlwGr6HqtOzcZx/1SM2
	 rKHOM4oj0S2WonZeBxUxVnr+fRpyrOE51wwXqWt8okhKh7fvG6x/47WfQ4NT4UzOzQ
	 wj60XaHMQA6JBMbEvYOo0WPgfDQqf1Gtjo0Rhiw51mFodplX7q/FSO33FfHOBe+Fw3
	 m2XROeQxcuxUA==
Received: by mail-il1-f177.google.com with SMTP id p13so7485756ilq.0;
        Tue, 05 Jul 2022 08:30:57 -0700 (PDT)
X-Gm-Message-State: AJIora/yBigDthA3Bza8xPMkHgV9zAgSKWdCSjOqXKgzmh7BAGFnC8Y9
	xl4Nri/tfywCGod+MZX4CpMtMuWfu48b3yfhypQ=
X-Google-Smtp-Source: AGRyM1uobwKoa1jgaeSGOfqWvAr3ryhlzckYrcL9SdV5QFDDrv6yCYQkwwjkfqlw0RWJgQzkkOUmhhgtYXCbFARIUsg=
X-Received: by 2002:a05:6e02:1be9:b0:2da:d622:6dde with SMTP id
 y9-20020a056e021be900b002dad6226ddemr16471966ilv.2.1657035056512; Tue, 05 Jul
 2022 08:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <b4392c845d0af4e0e9d06493078c8af9dc39e237.camel@mediatek.com> <10ed0b2a78baa88f7fd1d466036c98de2f6d8e29.camel@mediatek.com>
In-Reply-To: <10ed0b2a78baa88f7fd1d466036c98de2f6d8e29.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 5 Jul 2022 11:30:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4A4ng9Hkugr6oegxkOU0CCY5c_kUWM8E70kZP63CBYyw@mail.gmail.com>
Message-ID: <CA+5PVA4A4ng9Hkugr6oegxkOU0CCY5c_kUWM8E70kZP63CBYyw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8186 SCP firmware
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Shawn Ku <shawnku@google.com>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	Rong Chang <rongchang@google.com>, hsinyi@chromium.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_083100_401651_F8D78208 
X-CRM114-Status: GOOD (  20.20  )
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

Pulled and pushed out.  Thank you.

josh

On Fri, Jul 1, 2022 at 3:37 AM allen-kh.cheng
<allen-kh.cheng@mediatek.com> wrote:
>
>
> I am sorry, there are some mistakes in CC list.
>
> Regards,
> Allen
>
> -----Original Message-----
> From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
> Sent: Friday, July 1, 2022 2:32 PM
> To: linux-firmware@kernel.org
> Cc: Yunfei Dong (=E8=91=A3=E4=BA=91=E9=A3=9E) <Yunfei.Dong@mediatek.com>;=
 ";
> shawnku"@google.com
> Subject: pull request: linux-firmware: Create Mediatek MT8186 SCP
> firmware
>
> Hi maintianers,
>
> Add a new SCP firmware for MediaTek MT8186.
> Thank you!
>
> Regards,
> Allen
>
> ---
>
> The following changes since commit
> 9ed4d42c51aca99d70adc6738d7ea55c5e897835:
>
>   amdgpu: update Yellow Carp VCN firmware (2022-06-22 06:28:03 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/kuanhsuncheng/linux-firmware-scp v0.0.6
>
> for you to fetch changes up to
> 1c8b6c3dddf751f5f786bdd3440aa3ce238ab808:
>
>   mediatek: Add SCP firmware for MT8186 (2022-07-01 14:20:06 +0800)
>
> ----------------------------------------------------------------
> Allen-kh Cheng (1):
>       mediatek: Add SCP firmware for MT8186
>
>  WHENCE                  |   2 ++
>  mediatek/mt8186/scp.img | Bin 0 -> 416960 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 mediatek/mt8186/scp.img
>

