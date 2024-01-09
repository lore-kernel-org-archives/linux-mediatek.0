Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21052C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 03:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEnLu1LcTmyxrqiUIwucK/hN4b/7x2gyv9n57QlN75A=; b=yUfdtiooJE1pay3m2zH7E057h8
	/LDdf1TtKtLovEGb9c4JqrScQ4Rp5ud3PH5ygPCtkym00H7qKVIuFAplluH+0D0q1mjKMI1HYS/Z3
	IAXYjT/cmOFQ+H3wVHQnTZNaS7naSx9Eiv9M5Z8QXOnmHBi/mvpsL3lcniEX0nAMJeLdYyUVMC3mz
	GRHP6V0sQ6yuiPid7APQjwUTWWNyixK3x87A2NCKG7Rms6AFoFEWg4x/FzU7uc0MwTmbCNqtK9+pe
	yZRdSVAOsKoi31L1ZHVB3USMAx2x6dGpsGcBW+ylLlS+eRpcm7zZmGGJJsekl0xOyTb7DGJ/+mMfp
	iw/fOdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN2mC-006n5k-39;
	Tue, 09 Jan 2024 03:27:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN2m9-006n4l-2s;
	Tue, 09 Jan 2024 03:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 479C2CE0224;
	Tue,  9 Jan 2024 03:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130CFC433C7;
	Tue,  9 Jan 2024 03:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704770852;
	bh=oadwz3FDt1BgkOoIeSZJAkWVz6I1yACFQHKwE2eF30s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEQoqncykXWh5WhLRGHRsF4KdRp0/hgkzb36kwTxhoIsKZQkDBjOwmCcMSnAhYYIw
	 OpmAkvLPdNpHsZqkOQ1/38boNFVVUzs7iIEGwLvYegjuTZ4NiX2R0kgsR93uQUYHCW
	 Sw8rxDrS5qGUvFDgGZvw3BBcMKnNMiiWJ25f5QHBFRT/FbF0mhQp4tZ8jKUVl/Wldi
	 M0E52nYIpRGH9nzQecsLjll+KG4+9/sTW1K2E5CMFJ0K6N+bWgYi8QxFo1TavVEvHD
	 xKpZOGhR7YCBNkmLJsBqc/VQC7j6kqnPcZctbb7DB/WjMOaB0GgzWLlodAallz48gW
	 Y7UzFn5Z9hMYg==
Received: (nullmailer pid 2583107 invoked by uid 1000);
	Tue, 09 Jan 2024 03:27:31 -0000
Date: Mon, 8 Jan 2024 20:27:31 -0700
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: bin.liu@mediatek.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: media: mediatek-jpeg-encoder: change
 max ioomus count
Message-ID: <20240109032731.GA2578937-robh@kernel.org>
References: <20231227130812.148914-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227130812.148914-1-eugen.hristev@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_192738_107267_BF3530F2 
X-CRM114-Status: UNSURE (   9.76  )
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

On Wed, Dec 27, 2023 at 03:08:11PM +0200, Eugen Hristev wrote:
> MT8186 has 4 iommus in the list, to cope with this situation, adjust
> the maxItems to 4 (instead of previous 2).
> Add also minItems as 1 since iommus are mandatory, to avoid warning
> on the example.

maxItems alone means minItems is the same size. If IOMMU is required, 
then 'required' is where that is defined. Is there a case where 1 IOMMU 
is valid? If so, what h/w has this case.

Rob


