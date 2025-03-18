Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D485DC35FF3
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 11:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwp4pPphQ44qgUkj50Coyiqf/mBkbRlu/qCRtdImr6c=; b=lTjlVpYtuGOrD2KABEydXoWiy0
	LPtb95339etNOpQj0IKuWqDTNFwQHxP4C9F3Pe7kaF54p25P+3F9tFmMW6urWZ95PqX3l1T9FIrEe
	9iTEbKkH3f9P3uD79+GUyrVpzs+B7hPFTEEkDrVt3ghhHrs/E02XDlUlSMbxq6D4uS0gdSFU9bGu3
	LFsAZCc0LQRlkrSe0ZEWSkZ9zw/Kqy6AzMg4jy1yl1N5Ho6yYPZNerovDrBmRRvGJQi5bWjcH5R7J
	ewHTC5tloB+KgzPtMj8H7bL4guwgMU8S2pIF7sSygLXKDQ15Wu2/pag1dj1nTnePYz80n2BiS2mhL
	tHUp9+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuV57-00000005ilG-467w;
	Tue, 18 Mar 2025 11:26:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuV4o-00000005iih-1oO1
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Mar 2025 11:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1C26A48F5C
	for <linux-mediatek@lists.infradead.org>; Tue, 18 Mar 2025 11:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC74C4CEDD
	for <linux-mediatek@lists.infradead.org>; Tue, 18 Mar 2025 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742297141;
	bh=u53d10t3OzeD/76udFZ8KW80lLIlg3g9Ceg46PStDkI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TjJcS/uDmZnPdgcH8OC53ZeYnHsnp95IHARlGyjR3fdPUhpTNo/QtXF4aIrGpzMe6
	 iaIa/d6XOO+HXxP5qWbaV7qQhFxfWKanRLyCFznfsoSTAUGGuJnIvgNiwuqX4Xz/QP
	 DuDpDsmS8ph8N5iytM45ZiZ1pjitl9+GeFxOhxy9BCgEcCKqGXBEjlSECIpr8tqNus
	 uZX1mqwuM6MmCGwbMaQjeAdAAmYdxTv2Qg14+5ltQ4/9O7ygLFJAF17jWiBqW4+nwG
	 Ws+/2pFna3PTn6QrhRO3swcKBcBJ96V01Vg3GM1DVm9tjpHoompKPmS93W1jFH6rIa
	 2BeXor20SiCGw==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e643f234e08so1003542276.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Mar 2025 04:25:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlsoGywRkpcWPgka2/HK0szEMsAGM7pQf1LPWuloom1nHGsawwZG0JpvPmgEdQ5rZHhNb+yMHEhzmdSoFA4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5QQgzGJ+97jmvsjF+FhK4CvsFO5Nd8sp+l9DQUCNJL9vb+8sr
	W08riDggax6tkcyJTOKFU1RNsjRP5EpAzXr7+LN+l39S1mXOWXwO/WRXndY0v799cGNtXLW6+dj
	q7ie2sZi6cEH/gB8srHeOZ/LUT4A=
X-Google-Smtp-Source: AGHT+IEeK0EOLtzAVTltSAKfLyC9B/LB33cn5tKuSRUf1SUjNodydd5ksWB+YJ/3hXV4HmCmSiIF+ZYIjLVExZ/eyUg=
X-Received: by 2002:a05:6902:98d:b0:e5d:cc41:767 with SMTP id
 3f1490d57ef6-e63f65b45f5mr21357253276.33.1742297140292; Tue, 18 Mar 2025
 04:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250318094809.3540043-1-moudy.ho@mediatek.com>
In-Reply-To: <20250318094809.3540043-1-moudy.ho@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Mar 2025 07:25:29 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5wS-sxRpp6eKXNd+UY_j0t2BSeX+cfMjCKAAZ7oxnMoA@mail.gmail.com>
X-Gm-Features: AQ5f1JorTuQpqKyolMyCoIfauTYZB7EI5AUpzZk-e-gH1QBD7Up1bYof-3yVuv4
Message-ID: <CA+5PVA5wS-sxRpp6eKXNd+UY_j0t2BSeX+cfMjCKAAZ7oxnMoA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create MediaTek MT8188 SCP firmware
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nicolas Prado <nfraprado@collabora.com>, Jason Chen <Jason-ch.Chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_042542_542277_1FA76A76 
X-CRM114-Status: UNSURE (   8.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 18, 2025 at 5:48=E2=80=AFAM Moudy Ho <moudy.ho@mediatek.com> wr=
ote:
>
> The following changes since commit 588505068c48fe07b1cfa32c5f3acd4395ec94=
82:
>
>   Merge branch 'copy-firmware' into 'main' (2025-03-18 00:45:21 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/MoudyHo/linux_fw_scp v27749

This fails check_whence.

E: mediatek/mt8188/scp.img not listed in WHENCE

Please add an entry into WHENCE with the appropriate license noted.

josh

> for you to fetch changes up to a39712f2c8c9a520b889a45cbbdd2fa36d249cc3:
>
>   mediatek: Add MT8188 SCP firmware (3035-03-18 16:49:53 +0800)
>

