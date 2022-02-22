Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4yLKLBjChjfzK1NUVQBXANdrZPhaW/0TNcPr6y5erc=; b=HGLzxsMhtSFqUR
	wITPN32FHr8rbJd/8vnh2jzofgqr5hoi0Ma07deK4Az8DSkmUCbDUA2CiGV6VwcM1UDF8uGSKApAA
	Fr8sql2cMsNgeQexPvvbfUEABLwYsFQtaK1RzE+25sqjSoO6TNj/1mDq7CYNZbCFUTfd4ozpGZhuW
	kJtb5ViBC4JRKDuBPdyDBA/k6y11+AZzTVP8id8WbW0jUl6yW28gvGuQQ/4gWGLO+UP7HKRI/N1l0
	ybmmMSiDfUFJDE1fZai74OhX/a/JA1sKw958Gwp+xcbrfCX/LijKLkrJcd8HQGDqaYUJA/BDqxCvf
	TMD43/D46xAtW5yHMWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMb4i-00BOSK-BR; Tue, 22 Feb 2022 19:43:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMb4W-00BOPw-PV; Tue, 22 Feb 2022 19:43:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 5ABB71F43AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645559019;
 bh=Pk0jnhwgGaDY2hsNt3blMObpzKCekshWiMR7oa+aToM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLDSNQ7CC19MMUpsmLyKecnzVU4ItZZuCJ+3/Q0VOVvG/M7Rov1ltNTCd3z/rukXh
 lnt1Hi6le0Drx/NQR9ZlwD7vyMqXb4qAObcqGwS/33bvs7+FKYpabMHAMCA3NL4rN3
 buKYdQ7MpktSqYCpQNyfFktTnlKOL2PgEurPvf/dKE4yme4HRnCgXuTfuCYbrQ1eSw
 fJy39B4beAkRaxQJ0sVgxxghRdWIlYIUuf7AXwvwsc0L2WBAMdQm5qRGiMeDcYoQGB
 axZZcTCtcG7qNkpFYFBjSc4TgUzs3TpjuD+t88P2Lry84jwYXTCkhk2Swc6ipmyisp
 HuSzmHwclklZw==
Date: Tue, 22 Feb 2022 14:43:34 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 04/23] arm64: dts: mt8192: Add gce node
Message-ID: <20220222194334.xwm5mooh67gpfk4g@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-5-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_114341_003357_8BEB0AB7 
X-CRM114-Status: UNSURE (   7.11  )
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

On Fri, Feb 18, 2022 at 05:16:14PM +0800, Allen-KH Cheng wrote:
> Add gce node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
