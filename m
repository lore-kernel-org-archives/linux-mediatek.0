Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF5606A332
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q1axABdp;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjA6Uila
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T1O7v35TChmwhRKGhPjyiN2A1oz8HwzgsinjPccWIAc=; b=q1axABdpGTX25wS5Z41jvEb33w
	Pxi9kCzMbDcL8eUIc1LS4KFWpTv/NvyX4nsyJsV9VDlUnaxXL519bBqEH8Oftn9nvX0Jl9Rzh2f6T
	L9BEa8AefovUk1fI+O/pbqEw/TY69BIAR9W2hHDyl3/h8H5s0tHZH8mqppmkuzU3lwdRS2ZVYediG
	OwaBQH2n5rmzVBjH9SYNk28DEMNSLCehD9JeBeg0PaTBpthPDYPDol6LpI4gixsBLHsSlCy2WKJCN
	dfLuktQEdj0ec7Zn3wDr8bu1cxaUH96uDOtfEbRiG3RkCjhtKTKVdH/Y0/SqkT3bvTQpL8//ugeR9
	ag/BxgAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxkE-00000002sxw-1tdB;
	Mon, 16 Nov 2026 14:31:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxkC-00000002sx6-2P3f;
	Mon, 16 Nov 2026 14:31:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6CCC62C98;
	Mon, 16 Nov 2026 14:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DC91F000C9;
	Mon, 16 Nov 2026 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839499;
	bh=T1O7v35TChmwhRKGhPjyiN2A1oz8HwzgsinjPccWIAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjA6UilaDIq+zLRAmGiCH/sMvtw92IAzOkASfl1b4GVdBwKL02nyMSHJxW0SZrsOg
	 FYCaBDgqP+wUUb/n3RtnveKV/PSjlvF/jaz9r5ML6Sl7IKd1r1diMyd8UhSKrJeTfM
	 LoULTqBYmazEPARSgxPzG4adhRHrD9w2bHXg11S684RkYgF8Kvxg5Y5nJNsx5JPydD
	 982kIq9USJQXJ26Qmbj8EXuuG/E8iqDULPrrHcKL7Oz/jwEq4HTKXO8P0JBokuqyHh
	 vdegczXTGpMRvWJ1/mQgWPdSAVDf2d8U+W1R8nVk9GQtFj/dg+NHkDxGIyX72voO8g
	 ZZFtlgJsYOsTA==
Date: Mon, 16 Nov 2026 08:31:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: Remove orphan mt6765-power.h include
Message-ID: <179483949592.1142978.1015321511255077149.robh@kernel.org>
References: <20261105143647.2727937-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105143647.2727937-1-robh@kernel.org>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 05 Nov 2026 08:36:47 -0600, Rob Herring (Arm) wrote:
> Commit 22a77ae9bae2 ("dt-bindings: power: Convert mediatek,mt2701-scpsys
> to DT schema") dropped support for MT6765, but missed removing the
> include.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/power/mt6765-power.h | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 include/dt-bindings/power/mt6765-power.h
> 

Applied, thanks!


