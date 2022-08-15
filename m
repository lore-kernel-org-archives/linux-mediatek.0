Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AF0C00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsA6o9VJN5m/Z8AoN3X7MAF2+XQ5CDdFqoX3gmbxvOM=; b=KqvuZ56s5/9S8qFlNAPMv4K29p
	q4ouqy2EtP640BioirYvLQpOfFh9JIj8qE2Q2w4XLjxZ4ajYsg72MWnJ6Gk/Ps39OEaCkgD6W/H63
	b483oTzLhDrhu8FlSVYDtdsnpTOksL4/wPSxlnJwkoMUP9x6nZhP6XDsVBqMY0IEjHY+X4zGoQJ0v
	0CGH9F2IfveeUGQMeY8rJmjsutMIRYZydle8837imxpbioNff2Fl6FCxz+c0IsfcxoQi2iMUokUuo
	rOT6zByVFGrRD/ELdmYtDU0jKC6aRntYtYyPJjxJmfb9r7sJ95D6Ki617Ly19l86KHKurfdUJQHOK
	5ythvxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNZiu-00GTf0-Au; Mon, 15 Aug 2022 13:01:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNZir-00GTc3-54
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 13:01:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6566E611C6
	for <linux-mediatek@lists.infradead.org>; Mon, 15 Aug 2022 13:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17EEC433D6
	for <linux-mediatek@lists.infradead.org>; Mon, 15 Aug 2022 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660568495;
	bh=t3fdQbcocH0AGTqnzKeZbdFQhACemBYmZInhgb7Bcnw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=g2UvWxjmVEubSP4E2chP4eH39GWX+2fVDVnqrwku8HJKk9/2qPES5UuQ6s4X0Irfv
	 jVGsHgKy4RR31GymchYtt7TcP/K2FQEy7+XmZmCjTGtl8MS0Je2YOQXpAABgcjouHG
	 JyPHdZ1wJbTFOdyAB/QBNPPHw6H3iVc7ObYkNEdVM8dOXGVw7Le7B6l+Zz/Zq0VPO4
	 hqirM9LsQb2ZOGlsqJ8uTHpnvJKgAztWR/UTY326GzyC7+fgbUqzt9opAxDtqbbNVZ
	 SKPxAnpPBmd3wukcVi2oa8uG+IdFJI0mnpxrliQpCuiOF4LmnLYjQvbwlE7CVChGWA
	 EuIEzvMm4G94g==
Received: by mail-io1-f49.google.com with SMTP id y187so1986559iof.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Aug 2022 06:01:35 -0700 (PDT)
X-Gm-Message-State: ACgBeo3T2clQTRS++mDQ58v68mEHd+HqxOPTCPFGzIXXf4Zgn1LldLg0
	CxVFlK/K0OjGHM+LAwAon4pMZPSx/Sk+IlmfLKU=
X-Google-Smtp-Source: AA6agR4Y5pjbbRwS8KDCAWQXF2XuzcRKUv90eSiSNDQKSWDCS1Jg9saKSKXtqH9fP5yeW+IDEPONvd5nZIwWnaGkINk=
X-Received: by 2002:a05:6602:26c5:b0:67f:ccb3:c128 with SMTP id
 g5-20020a05660226c500b0067fccb3c128mr6577942ioo.209.1660568494959; Mon, 15
 Aug 2022 06:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
In-Reply-To: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Aug 2022 09:01:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5_tj63z8izA_wigVtXzCUDSbuAhgtpVS6psSBdSXJ1dg@mail.gmail.com>
Message-ID: <CA+5PVA5_tj63z8izA_wigVtXzCUDSbuAhgtpVS6psSBdSXJ1dg@mail.gmail.com>
Subject: Re: [PULL linux-firmware] mediatek mt8186 SOF firmware v0.2.0
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	chunxu.li@mediatek.com, allen-kh.cheng@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_060137_375605_3A34C871 
X-CRM114-Status: GOOD (  21.87  )
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

On Mon, Aug 15, 2022 at 5:13 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request adds new MediatekTek firmware for MT8186 SOF.
>
> Please let me know if there are any problems.
>
> Best regards,
> TingHan
>
> ---
>
> The following changes since commit ad5ae82019480dc1feffb538c118397a40934e62:
>
>   Merge branch 'main' of https://github.com/suraj714/BT-Upstream (2022-08-10 07:58:34 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mt8186-sof-20220815
>
> for you to fetch changes up to 12ca0753342651fa2ab640deffde5e51b0dd9868:
>
>   mediatek: Add new mt8186 SOF firmware (2022-08-15 16:43:11 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Add new mt8186 SOF firmware
>
>  WHENCE                                              |  21 +++++++++++++++++++++

Pulled and pushed out.

I noticed several of the Mediatek entries in WHENCE all put the
license information in the WHENCE file, but LICENCE.mediatek also
exists with the same terms.  Can we clean up WHENCE and just have all
the entries reference that file?

josh

>  mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg | Bin 0 -> 16191 bytes
>  mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg  | Bin 0 -> 16191 bytes
>  mediatek/sof/sof-mt8186.ri                          | Bin 0 -> 128712 bytes
>  4 files changed, 21 insertions(+)
>  create mode 100644 mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg
>  create mode 100644 mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg
>  create mode 100644 mediatek/sof/sof-mt8186.ri
>
>
>

