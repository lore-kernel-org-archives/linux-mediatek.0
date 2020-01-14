Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F96C3F68F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 13:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804732467D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 13:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y88+uWEh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/lFZEhd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804732467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mp2clQljv25/Olc1T2+Y4bVkt2c9MwldDRa4ve44BUI=; b=Y88+uWEhVDsle3
	YhQqVBfBGM57mTzR4uPZ5ni70dvFSL3inT6pio4xHSGLGJGpWqX8WG6iJ+o09m+sAMXu7WEJr+eg/
	B6Gmc+rI3j6JjxZvXqXwR9ZM6J0tbeqzjfdhAu8f8OIozWts8YVkIKi29HdgeXs1Wfgwmg6usO6x6
	rQkXNZ6oXmoDuI4UG8uESP5abdVxmKw8+tRj4heTj607Ht7Ye6sxrDK7AZCpZA+ZNU3bhO03KBDqn
	rJVNcyasjd50tAx4TsJD3vJjutWNBzR8XTwZSQyOsFc6whaCYsvTqV7bfNxrijn5W/JNrPTDccF1b
	48oFX4PW3ymFX3mBwExA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irMLj-00084v-M4; Tue, 14 Jan 2020 13:35:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irMLW-0006kx-FX; Tue, 14 Jan 2020 13:35:06 +0000
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41E742467D;
 Tue, 14 Jan 2020 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579008901;
 bh=0ghVVnTBZhNvg1AJ2oPToO73881dd/NHeITQTqTLWxI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G/lFZEhdHe3ydclV+TmtrDs9QjTdwW6bZ31l3IhVdfAOwOCVu2AfDi94vmifvYmm1
 TXFehXUCRWmiGutK1ymNrnQtMUGERrIgLohMmfLFNu/px184/IyY6AmwqxILVhrygJ
 NZBCIjp3FRCbLPTESuVqZfBtOrfNLGNjTHthFOkU=
Received: by mail-qv1-f50.google.com with SMTP id dp13so5626145qvb.7;
 Tue, 14 Jan 2020 05:35:01 -0800 (PST)
X-Gm-Message-State: APjAAAXEWf7HHqtN3BMlNyw79D0FZhl8zaR0Uhmwg1eS0sBBLnSwQR4B
 eyKT6vJgFgj2YNALcOA8VEnk9C0kblD8EIL3c7U=
X-Google-Smtp-Source: APXvYqzOqlxC0uai1sE24Xuw2w8hBzEMT/71be1S1hw9KqGPL+bJoJZFBLpiVMGuBZvnEV9JeXw9j+9BEBZFKOwbSCs=
X-Received: by 2002:ad4:4dc3:: with SMTP id cw3mr20423625qvb.130.1579008900416; 
 Tue, 14 Jan 2020 05:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20200114091836.19403-1-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200114091836.19403-1-gtk_ruiwang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 14 Jan 2020 08:34:28 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5aD+8Zc-e39eUtE=vPA_Dm5Z5_iXhFoYwpKstUssUVWQ@mail.gmail.com>
Message-ID: <CA+5PVA5aD+8Zc-e39eUtE=vPA_Dm5Z5_iXhFoYwpKstUssUVWQ@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
To: gtk_ruiwang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_053502_552827_D38BE626 
X-CRM114-Status: GOOD (  15.99  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Linux Firmware <linux-firmware@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 4:18 AM <gtk_ruiwang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 67d4ff59bf3334895626cf165e508e9eb1846e24:
>
>   Mellanox: Add new mlxsw_spectrum firmware xx.2000.2714 (2020-01-07 09:08:25 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.3.git
>
> for you to fetch changes up to 7f3177d224ee7afdd6e36ed01a13f499d671e167:
>
>   mediatek: update MT8173 VPU firmware to v1.1.3 (2020-01-14 15:33:19 +0800)
>
> ----------------------------------------------------------------
> gtk_ruiwang (1):
>       mediatek: update MT8173 VPU firmware to v1.1.3
>
>  vpu_d.bin | Bin 2977008 -> 2977136 bytes
>  vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

Pulled the v1.1.3 branch and pushed out.  I'm assuming the pull
request is sufficient since it looks like the patch you sent
separately is the only thing in the pull request.  Let me know if
there is something else needed with the patch.

josh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
