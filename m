Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72955C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rw+or4zNSpkmLTOrdPf8FXu/TOWsvgIULpQDBeNebKo=; b=CkkY+RKlVzzgg8
	Y9us7STuEZ9eIpuTlzcQipqG0/iFwnlFrO0fBnOVU1LZfBMay3iL++FbLHpEkK0ZnxGqyxhd9do5j
	EaFkoN+Xim6b9fusrClrcB9TSmjtCToxV4hAteIFodW9RjnZB59MK0yxp1Y9uTpBKSSNlHJtXKU7y
	qEs8xKmlJIodSXjGVBtGPOva0MI3xBR7lQ/aRTUUqerPmOGrT3rdQ/D0DF28p5xWfTbgNtoqy18jH
	Qul5NfB5H917Ul7tEkeGUyx3OXiVNYseGlvZr01008Nh80TEXshCIsssRUQXTyOKYbxWuI1LZahgY
	BoSXdbpVBSLUvD0gS4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRCyb-000BAH-OU; Mon, 07 Mar 2022 13:00:37 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCyZ-000B8F-0Q
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 13:00:36 +0000
Received: by mail-yb1-xb34.google.com with SMTP id u10so10913608ybd.9
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cV/iRWpEISoBT8RqYrC9Loyzy60WPxJLdJrpUBpn9N4=;
 b=LVb++RVBZfne8vu4GpNufR3TESTWg0xLaPgW4a8mWdgu+RsfCq0eSp7KjWLVehEZMi
 Nqc9VQ04sWEuTzePC1BAc92teVEUvdGyPyD24J9VgfOlza/1uyEZeVS4Rz+ev0Kg+g+w
 mVMXXPm1QDuom6dMCjngUykQ4yCV1nwKEqJwjVs8PmDIVYk7pJ+0X9Fc1Ucm82OLgzKY
 rFrdY08sjABSAp4mH5xB7Jz6UfirJs2eorbxcisS7cxmYySScStHT7AH6YMGEz0Mv4jA
 x4/UXhyzWP0afg9vP2AQLMwR4es9LiI26n22K0Fn0iAsm4g/NOcto86FXEk64Rn1bgyX
 7uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cV/iRWpEISoBT8RqYrC9Loyzy60WPxJLdJrpUBpn9N4=;
 b=Ub1PnfwLzw8CiUg3eEWQwRZ/CRPgtzaWphz5ZVsPI0rXwQagFYikbGZlKJCYXMf5uc
 wr4xix0Aqx6pvXEgFpYc5nCdH4mZmZOF7gaNKw2vhhF5k4400eFvyioxUciw0iNRsIPq
 Hv9snYc7rgaw7zGRDWlQaT0LyPZ0uNaaK/qpNZaJqu2uLSQ0EjqbGGjQd75iiTIkhysb
 JORV6gKoeHcYn9/O7aHQqC99kr4xM/Fbpb7+k7LY6iD+Gq0B4/hEfU2V9XKtaKGd1rR4
 FbH53TrldkLL1E619ZgoE8mgxtOL5C5/BP9xVVM7PX2EPsbNJp8sriCKX/o7jqCNMYie
 Dqjg==
X-Gm-Message-State: AOAM532rid9/iwJ8jiGP3zROp0IaJ8BE9dlEKziKXgM+/1qSezjpDiRg
 xqZfk/Ohb+jcJ1qYKc02Bcl8qxda4lHAypoSfClHTw==
X-Google-Smtp-Source: ABdhPJz7y/I54piNlQLkLmG1TBL8cO2TtZqqA/3TeporXhO/Ll4av+9Oeyrz2ZsqrqwcxxAf9U2afKUDEFHXjPyXHVY=
X-Received: by 2002:a25:5090:0:b0:628:b76b:b9d3 with SMTP id
 e138-20020a255090000000b00628b76bb9d3mr7938482ybb.128.1646658029569; Mon, 07
 Mar 2022 05:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20220307091702.378509770@linuxfoundation.org>
In-Reply-To: <20220307091702.378509770@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Mar 2022 18:30:18 +0530
Message-ID: <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
Subject: Re: [PATCH 5.15 000/262] 5.15.27-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Netdev <netdev@vger.kernel.org>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
 shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
 pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
 sudipm.mukherjee@gmail.com, slade@sladewatkins.com, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Hou Tao <houtao1@huawei.com>, 
 Christoph Hellwig <hch@lst.de>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_050035_058511_A71513D5 
X-CRM114-Status: GOOD (  18.49  )
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

On Mon, 7 Mar 2022 at 15:07, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.27 release.
> There are 262 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 09 Mar 2022 09:16:25 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.27-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


Following build errors/warnings noticed on arm64.


arch/arm64/net/bpf_jit_comp.c: In function 'build_insn':
arch/arm64/net/bpf_jit_comp.c:791:21: error: implicit declaration of
function 'bpf_pseudo_func' [-Werror=implicit-function-declaration]
  791 |                 if (bpf_pseudo_func(insn))
      |                     ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors


drivers/gpu/drm/mediatek/mtk_dsi.c: In function 'mtk_dsi_host_attach':
drivers/gpu/drm/mediatek/mtk_dsi.c:858:28: error: implicit declaration
of function 'devm_drm_of_get_bridge'; did you mean
'devm_drm_panel_bridge_add'? [-Werror=implicit-function-declaration]
  858 |         dsi->next_bridge = devm_drm_of_get_bridge(dev,
dev->of_node, 0, 0);
      |                            ^~~~~~~~~~~~~~~~~~~~~~
      |                            devm_drm_panel_bridge_add
drivers/gpu/drm/mediatek/mtk_dsi.c:858:26: warning: assignment to
'struct drm_bridge *' from 'int' makes pointer from integer without a
cast [-Wint-conversion]
  858 |         dsi->next_bridge = devm_drm_of_get_bridge(dev,
dev->of_node, 0, 0);
      |                          ^
cc1: some warnings being treated as errors

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log [1].

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/263ZKyWWLLcPGRbiZwIEZw3wvXX/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
