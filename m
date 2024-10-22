Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44674D1CDA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRsN5h7xD+/nYzA6dAD9JJg7Z1R/Xrz/H6A8dQ/mmBI=; b=EDftD1U/54NQSpskw+Bm5JURjV
	TmvrwPhpz9gQRnRWi5BizSSKYHYYllqeIyvAssMw8k5BNYtJbIzX29Yy4NJq67E564taNvzooHcl1
	aKfgvxda/g7EFKL7ObY6kGb/cOLpK+o77+mKxw1Xt3Ue7eoWzjDLX1DdO0NRVqRiJs1LC5vk1Q5zv
	EWLzv4OdDrA8woy9tqJHmsZFWHaNwp0ViQ7bc3ebut6xgHossVsgu9YFi1yzwPAFZelMLqMrLYv4k
	ikkdmS0LonLe/5ft/JOa3YWetJZA02h5CGAJVE97Pd0YMcESZ9ikYUvSMYKJEDxf/CgRNfJiE5zda
	UEj5E6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t37T6-00000009eXu-0nS3;
	Tue, 22 Oct 2024 05:30:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t37QC-00000009e6R-2IGp;
	Tue, 22 Oct 2024 05:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 157255C5AFE;
	Tue, 22 Oct 2024 05:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D41C4CEC3;
	Tue, 22 Oct 2024 05:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729574827;
	bh=lFAI3gletFq7EXPE9VsStAF+xZwzPU7l/YG+ltpKHiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EDtswBD+4v1S/+A9hL9AYQyDQMG0XMPhS/omBNnapYTtcp9x9Kwq61wbebFOuLLsM
	 7uuFmbegF6tYi2DPdj+tpJmOEHwsdweLi92dg7+3S3qtxt3DgFbOpTjEjW+eWBF0Rt
	 puemWGOvaajZCG2nimNQ3xSORdTqxYVgcVQayYLUaGcbCl3Ma+BNpwztuDUYkMvvBk
	 LmgvaQ9dvOrlGnuGd+QahZy4eSlbf5EKhBbNo2M5MdpEOb5/2X1MspKwQ5aWLyO8LJ
	 1rMLnmEp9SWl8RGklFe3gCmfTwWylG6/nqYkFPGYluLKx+/O5kopt0CRMXqfgvk4O4
	 3ZHAa3LFsP4kw==
Date: Tue, 22 Oct 2024 07:27:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, wenst@chromium.org, 
	hsinyi@chromium.org, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 RESEND 1/4] dt-bindings: arm: mediatek: Add MT8186
 Chinchou Chromebook
Message-ID: <endnevb4ilgyccy6ayfr7gscskqdzr3gcgowdow3qnmrvfrxdi@t2nubnr4y5jh>
References: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241021072626.15102-2-xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021072626.15102-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_222708_651889_E701140A 
X-CRM114-Status: UNSURE (   9.47  )
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

On Mon, Oct 21, 2024 at 03:26:23PM +0800, Zhengqiao Xia wrote:
> Add an entry for the MT8186 based Chinchou Chromebook, also known as the
> ASUS Chromebook CZ12 Flip (CZ1204F) and CZ12(CZ1204C).
> 
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/arm/mediatek.yaml     | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


