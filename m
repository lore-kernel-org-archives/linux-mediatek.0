Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399FFC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00MZZt6j8xWZKJPffoVSE7zc5XIuFi5EqPvu0/IOU/c=; b=4w85NjybSoFtwp
	cAFsOu4y7b0iVjdC9gZkr/9mGdUArVn4FMjD8lgOwcNKqDgYItoJhHOvhVCvgsiao/E1O4GwNmeYg
	HwelFZ/HQRlogBBSkDgQWgBErX+OqKeHIgiT++HeYDP7KAPwjrIlav4S3S+SZk0XgIjmCKprENBH6
	Bu7SfYlOwWMWGzLT2+CWw5rOL//jEjAFMzhgSOXplmmhku4vw3CD1d8Wug6sYi4Muq3vY1VlAcSKo
	37ijKklHGpERCw1EenGmN0v+vviZ1wT3ypHE5b8q+xCAnt/pdvMPjJWRcQUbSxJ8LhiKy1R+nu2Oo
	L9rRDMOdS+D1ylsvP5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFFE-000bcy-LN; Mon, 07 Mar 2022 15:25:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFEu-000bTF-Nc; Mon, 07 Mar 2022 15:25:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7C0761494;
 Mon,  7 Mar 2022 15:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B884C340EB;
 Mon,  7 Mar 2022 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646666733;
 bh=BNQWhI2ZZ59vaTrOPgc5ts1aXPYVmELNBcWywiAR6ug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnAbyCdbk1hQur6TFu02eVVDcJCVsjO+0vHlxOYZuK08YK0WDdtrP0AY8VMxqnRQx
 oRs4ngY50FAS0myedFBp7iw5T0zkCCKtxsg41jU5JIOIhChW2pTYVEJ7t7PYYAMQMF
 j6zFXYzafHCzaTD6CLd/Tf62jEwuUnbmS8eWr91M=
Date: Mon, 7 Mar 2022 16:25:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Netdev <netdev@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
 slade@sladewatkins.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Hou Tao <houtao1@huawei.com>,
 Christoph Hellwig <hch@lst.de>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH 5.15 000/262] 5.15.27-rc1 review
Message-ID: <YiYj6t7uhxZ5cw2t@kroah.com>
References: <20220307091702.378509770@linuxfoundation.org>
 <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_072536_840960_2C7539C1 
X-CRM114-Status: GOOD (  22.54  )
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

On Mon, Mar 07, 2022 at 06:30:18PM +0530, Naresh Kamboju wrote:
> On Mon, 7 Mar 2022 at 15:07, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.15.27 release.
> > There are 262 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 09 Mar 2022 09:16:25 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.27-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> 
> Following build errors/warnings noticed on arm64.
> 
> 
> arch/arm64/net/bpf_jit_comp.c: In function 'build_insn':
> arch/arm64/net/bpf_jit_comp.c:791:21: error: implicit declaration of
> function 'bpf_pseudo_func' [-Werror=implicit-function-declaration]
>   791 |                 if (bpf_pseudo_func(insn))
>       |                     ^~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors

Found this one, now dropped.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
