Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC23C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 19:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYMg8ais0YOkdkscQffhLb428kq7+Hgh8qUHCqsp+nE=; b=JlsQJGa7qVfJqo
	Vu9sp6K9I+PsfBSorhGGP4OO3LYigOlHhDLj5avpRoJyLIqYpVkbY1tJrwoL1dI1IrSmT2DNOMtkr
	n7AwtbQJjiuYPNHqoHUy54rFpZglvc89/lifzaY767bkrehaiuiNrZ1sHKgJMWyY4XxZwzW6Qezl+
	hXjKkrx9BzRJE5nNCP/IWeSs7T6Wc4ZJOlUG9DNP7AImg5EgxLEWv4p5PeXTYgHKS7WjeMGNuOgRy
	GcpjdEEfyCdbFEAQeTZsxBcbgyeKqmJJnp+ka7XyHFcJtzJmihrKoujEEnMUPeJRmwD5RarBpyVM9
	IoepxXXU8TTfgdG8Ke9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMamF-00BKr6-IF; Tue, 22 Feb 2022 19:24:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMam2-00BKmT-E8; Tue, 22 Feb 2022 19:24:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C251A1F438A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645557873;
 bh=84ngh8hfVnYOA1iVw38mIlicE6d774xxlmyzKJEKbDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jug73saHREsfKSjJcnkKSo4QrKWe4axGeTVYiTEEl12Nxrh/3/bsEGeIvozu1ral5
 bjqrtbTZMMwa3pE8MsHc7WzpEYBwMjZHPu4Lx/jggVqfJMsdT72lns83ZNbdctPVU9
 6kEndgG6gXxuFrf4sLvPK1OD+T0ma/e/f+rWVIqOOZSi3xFtS9FWTXhxYcLmzQP5dQ
 HLvoYk0RUsEKUXt1WBj9x2gGhjtPsCHj0DECiwVGRL7ZqirNaAmmSIQIJR+OY3dcwn
 M4wovVH5xUyPlXHDsn+vIkQPN0v3S92gvHDZYUFVRtUO05PRwWRNB3kGqUmFk3//IK
 ya8iISu+grbHg==
Date: Tue, 22 Feb 2022 14:24:28 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 02/23] arm64: dts: mt8192: Add pwrap node
Message-ID: <20220222192428.i7sjiim2uwrqvfng@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_112434_629712_D98CC8BD 
X-CRM114-Status: UNSURE (   7.22  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 18, 2022 at 05:16:12PM +0800, Allen-KH Cheng wrote:
> Add pwrap node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
