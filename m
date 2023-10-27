Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE6EC25B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 20:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWT6rg+UcGuVHCGktF1X9nMLt5S5rmKf4Xsx5qvsANI=; b=49xL8IqGJRGxQy95eHUPLmNiML
	qT1MU1mVCTLTGxBLW6HDoC8EV1iAyGjqqFu6f3cRr65woXSg0W70hMCM0b4wIqa8OlFyMQPf47Dkh
	Nvq9Psun4VQpAHO+LFOPI081+cvlsMd4vAeqxYHg1Yut60cvrUo+VHE67tllpYFu+DaEpbLNyjXZt
	oFMmRqVzldnF+LhBPSSf7BZDQqjSnLqpl3ICbNXPcZV87cpMFbfEqlW+Gb/I54w/xtYRdkqIVnST9
	br4kRHh3wg4iLS/q20Syk4UUoXlkqdl1qwJgYKb2X54tg4rxE+vDSkYbnGRDHARHW7GceqtXaq30I
	mBuktVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwTiU-00HBhM-02;
	Fri, 27 Oct 2023 20:46:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSZX-00H6w8-1X
	for linux-mediatek@bombadil.infradead.org;
	Fri, 27 Oct 2023 19:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ZWT6rg+UcGuVHCGktF1X9nMLt5S5rmKf4Xsx5qvsANI=; b=FkpkfsA0YD175StFoV9CJq6tf7
	AxRPwrGKnH//iwLU3HD56PZQRlQAd3iRxKFp8h+VRRyg12vGR30gjy00HHz8C5rYYmN66+251/gtO
	PTvts5+pszzTsupNb/tOoRHZA9SMARRQCSuGkB5q/B88E9uRkBonfsRAFOVirgqJAge0MakR8cCI7
	eUCj2DnitZnwH7wUwCPF9SEuSLHQn1DITrLar3oRTjtC0qbUfxsIum2d3KIGTQh59+KQ5xSCxw3sc
	r2CkEslun/9z5AJJq4PctHL4/pGUXCaaoEUtxUngRWzHyysZpGl7qb5jj/mmAPB4dAOBs77orHIDO
	n/9IBTkg==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qwSZS-005Bcx-My
	for linux-mediatek@lists.infradead.org; Fri, 27 Oct 2023 19:32:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9d10972e63eso62074066b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Oct 2023 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698435155; x=1699039955; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWT6rg+UcGuVHCGktF1X9nMLt5S5rmKf4Xsx5qvsANI=;
        b=DbNivZZDRlmsG5wBlj1Tbv8i8fZF4niPmIRCmIY8ehilIDFoT+WF7Fv35fqEp5pT9K
         ygdb1Icp7IkU4XpCj/IsfOHmDhfWqtvj+zM91e9TlIrH3tqiHlO7ren/dXI/dH4pcmfq
         SKDH1XIZh1edHbog0PjjEUPhTj7MLIFkKMhiBCCu1+o/KQo+W7ht4R83NBA+qDKhuHVN
         Q+1FIDDWcENkmzhVQYKNh4u5bIpyoaDBOkTHp5S/WlyrdQMkDLN7Hidc9lPpLlz5M+O0
         aljvBoNzswVLSUbKn6xpO3Q9XoAZnwmo6r9zE+jCXEgARCcM9/F27NfiHtEcOGs9CSXK
         nRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698435155; x=1699039955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWT6rg+UcGuVHCGktF1X9nMLt5S5rmKf4Xsx5qvsANI=;
        b=AsFzQBCAxvMnhROD4u9VHeky0p5vSxJ97E2EpUzN5xWbdZEx1rSck+RzcdEu36nMWW
         1fwPkoTKoPzG7NwZz2aUKIO9rNp5vgHGZ83Ya/6oIuXvWs59jfZE+sqyTDFc574EwBQ1
         xsyJJIrxqDktTMsRXo6+wG1XKQniYUloh0DVfT9AiEcEMprJNZa3FYdVS9HCSydmr52L
         jxpGRAUfYkFzvX6wzYjELCASd+sminlOYv3cZUhIW4pDA3x2AnmrmSCVSOgLCXM81r0J
         msHy5sgrBiANrfOLJ3TsReqec0c2+0gxN6izvG+CqjmRDz6R+/FYXwnzzl8dumTUZ7Fr
         WHMg==
X-Gm-Message-State: AOJu0Yz/Pi58bavcKzR76pdGr7dXcaV+jBcSNPdF+09ciBF0tHZn0Hpg
	lLNYuv6sjZ9SMu+HlGoWqxnfGPUQ6jAkO1x0dLqD2g==
X-Google-Smtp-Source: AGHT+IHAODo9hINKXNlQvGgAqxNPpRnNjd4AA89Jgp1KLx343fQyHwwoszpkk3UnOGcXvbD6V54sQTKCIm/OR/KX2/4=
X-Received: by 2002:a17:907:a0a:b0:9bf:b129:5984 with SMTP id
 bb10-20020a1709070a0a00b009bfb1295984mr2459494ejc.77.1698435154557; Fri, 27
 Oct 2023 12:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com> <eda2f651-93f7-46c5-be7e-e8295903cc1e@lunn.ch>
In-Reply-To: <eda2f651-93f7-46c5-be7e-e8295903cc1e@lunn.ch>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 27 Oct 2023 12:32:22 -0700
Message-ID: <CAFhGd8rSw7RRXTh0XE6EekPKeka34k5RT93gzqvP8s=PntCdsA@mail.gmail.com>
Subject: Re: [PATCH next v2 0/3] ethtool: Add ethtool_puts()
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>, 
	Sudarsana Kalluru <skalluru@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Dimitris Michailidis <dmichail@fungible.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Louis Peens <louis.peens@corigine.com>, 
	Shannon Nelson <shannon.nelson@amd.com>, Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ronak Doshi <doshir@vmware.com>, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	intel-wired-lan@lists.osuosl.org, oss-drivers@corigine.com, 
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_203238_762006_B6F4FABF 
X-CRM114-Status: GOOD (  10.40  )
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

On Thu, Oct 26, 2023 at 5:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Changes in v2:
> > - wrap lines better in replacement (thanks Joe, Kees)
> > - add --fix to checkpatch (thanks Joe)
> > - clean up checkpatch formatting (thanks Joe, et al.)
> > - rebase against next
>
> Please could you explain the rebase against next? As Vladimir pointed
> out, all the patches are to drivers/net, so anything in flight should
> be in net-next, merged by the netdev Maintainers.

OK, should v3 be against net-next? I opted for next as a catch-all.

>
>     Andrew

Thanks
Justin

