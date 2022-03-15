Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 00:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mBQYGIzuKzxU3nNTzD/CN7hHjOTsDrGyOwCQvl9ps8=; b=yKN0OjtVa/qm0R
	kTQgykOIZPrdFR6arD3go1UJ1KC5rVPBx7mxWKF4XVCjUsaMGiPiOHa6tX0feVBsJ61ZhXTkQ3/dR
	t/+F0kRQikij/oCqoZA3UgsF+BeaF/KI0EH7Rr4VEUlvApIxZmZfrKwtHzNtyOrnpiAleUL7XLw1D
	xmoRu0CxUhOy7v+kuoWG2K0M6TLJc5X2/otwZupWhtNDdOKUrTwhO0eXmHM37IHzeqWM+3hs1rdur
	CeZSnlFUs8kqfQLHUog9GMU/udU1T5QzTMX0mdOdfVnEsFbYQIkiq24pOKI/uonJuuRqi9Z2lJtul
	yluTjKrBOZ6xG9QJMwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTuwy-007Icb-Cl; Tue, 15 Mar 2022 00:22:08 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTuwv-007IbY-9C
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 00:22:06 +0000
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso183963407b3.9
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 17:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MqLppnGP4MbsD+gVviOPlH5VnfiPJBlj6/pZOIVk87s=;
 b=dMTpOfPNcuKpTGl/JROG/JfBp6BpRXuCPI7gXdwwNZxgiZQqpugLMPeFDPkXwYOwwq
 zDFEZFGTMp/wQ6s/n41FvqOf+fP7hCh+PVZEB2t7yvJsx1Py+mmYIE3wkIB97ru3nxnX
 8iYD+r3adI3DiwmFOBL2Krua262HaeWj9bFF2ITuaoCFESlH8e+0u021wuDwaqlzgUSK
 jvHFShoXHwMlO5Ztbj0woLMnJxFlzb/0lNljSP375mC4gS/Vh18qtVTL6Z1NbHDOIMTl
 rVEeLLIPlcXdPbpCF95OoYCr0MzRoZ2hGVrKMN1+s+RaFT6lYYoPrqTrDtuaxMzCeV8H
 6Amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MqLppnGP4MbsD+gVviOPlH5VnfiPJBlj6/pZOIVk87s=;
 b=43S2HU8jYyLOCMsnUVrurJ4gOfTX20tS9R7MKamPqEh0ZdFpOGhqoybUml3jTUkr/d
 5VqzufR8tNLTkvGdFqBxZLXqLJp1gmnLvFcQld9/2ZsqniaH+WnvJAcPshpT9CUdpvZX
 rtirETWvpmfIofCQ7kPg/y16OuwmAenMVE2qsstPtgKGMhi7JixvMssjA3TX5+R8Zwya
 YjaMRWrZxnGdy1PJGzNBlaSD6OlBhCGnJcBWM5oYtTahmWP1U6AH7EYeGwY14SSjAQcx
 UGTuXPdbMFmr9gCaMOeM1vE3F2detcm631PIMpV+zXXQ6R0gKKkzMzy92ATGxHR9s0mY
 A2Rw==
X-Gm-Message-State: AOAM531LcW+bmhUk7R4sLKVzpQMBE2Nd6kiixTiEtQ1Ac8gbioAubmf3
 O2WyzucHCugYtvKMSt1/T5dMccOwJrQCXxFOVtiO/Q==
X-Google-Smtp-Source: ABdhPJxPeLs/sQQPILHw4rprmLVR2kPw4SQcmTT2sG/U6jXD1r8wVmQwtPptjgzVGLG2oUXGgIKZdPWG432SjaJd4sw=
X-Received: by 2002:a81:89c2:0:b0:2e5:84b7:83e with SMTP id
 z185-20020a8189c2000000b002e584b7083emr1458669ywf.448.1647303723144; Mon, 14
 Mar 2022 17:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220308071155.21114-1-linmq006@gmail.com>
In-Reply-To: <20220308071155.21114-1-linmq006@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 01:21:52 +0100
Message-ID: <CACRpkdbu_rqQf101WC+bf8io_Kr7eDvRwt3h9yq-kAH-9Az8Ng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix missing of_node_put() in
 mtk_pctrl_init
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_172205_352753_101C7758 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 8, 2022 at 8:12 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
>
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
