Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34236CD1297
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shEc3LsKga54Vct/4pIJBWjDA2J5kxgxxhxDiEOlywo=; b=ok3wCOWQwOPyTF7Y40Fc3Y6z/G
	ah639sbla4Mi86kcF7hRNh6Xs0YHgrwlalDiyG7HKf9u6l3GAQR/PcbMTdUhlHTGJXTxeimCP8Lun
	HeH9g9poJ9mMMS361jqivvb9zX6mpidb4DKb7dLNOshO5+WMPgASc7x3eSMTBAqzHmSmJx4KcWTdd
	DAMqQDCVG+LAlVcR6Vm27keu/DD7SYCRBF5B5HSjXIEvRstWOYGUnhlXYAG1fqgvPe7XkrGxoJNSu
	/iSDDQkkUsIbZ5UX5JB/1ZngOU81KASrrJNeezzk7KX0nbsVtKBf8K8nj8VzDhhmqIKmiY0NG/AyN
	NUF8YZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxuY-0000000FXAP-3ieh;
	Wed, 03 Apr 2024 10:32:06 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxuL-0000000FWzj-3GJP;
	Wed, 03 Apr 2024 10:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140312;
	bh=bKmDSIDkCEXhaz2uF+QbMZ0GeW+xwltWAAyCQPnHrsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fcOKvHeZ4iWpHRfxSuyrNsWLaqd0HmGeQy95YGjLOp/I7wVH+kBZSnB/6qJHevjpO
	 iBYwjU0GA/A46YUUoCyNcrDFD8KVxGZhhPgwWiIWCFn1ZrSq3vlRKTzrkKSPULW8UK
	 5q36mLKNLcHE1XWYhRGNmKmPU5FSJECCoapJ32tMshBSWBpnC3wualBqNpin0b1Jy+
	 zrbfCRF3abIDHaxxQo8JSSVP++ecaWF7w3n9cgCjZaASLqm4e1v4i8RVKBb58221dZ
	 qDIRAMpEUvFQah2UOt635+rQLYPMogbRaBGtuh1WgOHcDhfgtTWdIMD2LSa8vaGC7T
	 CbK1JyivpJi9w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EA82C37820F3;
	Wed,  3 Apr 2024 10:31:50 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	robh+dt@kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH v4 0/4] arm64: Add support for Airoha EN7581 Soc
Date: Wed,  3 Apr 2024 12:31:44 +0200
Message-ID: <171213798076.111748.1656778458419095721.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1709975956.git.lorenzo@kernel.org>
References: <cover.1709975956.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033154_657226_DEAD721D 
X-CRM114-Status: UNSURE (   8.37  )
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

On Sat, 09 Mar 2024 10:32:13 +0100, Lorenzo Bianconi wrote:
> Introduce basic support for Airoha EN7581 Soc and EN7581 Evaluation Board.
> 
> Changes since v3:
> - remove unnecessary entries in Kconfig ARCH_AIROHA section
> - cosmetics
> 
> Changes since v2:
> - fix cpu-map definition
> - add more cache info
> - add missing soc node
> - remove unnecessary definitions
> 
> [...]

Applied to v6.9-next/dts64, thanks!

[1/4] dt-bindings: arm64: dts: airoha: Add en7581 entry
      commit: 82aefd8f1f1e73f95523a8eebf3d52719a946120
[2/4] arm64: dts: Add Airoha EN7581 SoC and EN7581 Evaluation Board
      commit: a8ffe7cfce40c20a2508c474e49bfd9f29d0e253
[3/4] arm64: add Airoha EN7581 platform
      commit: 91ed3fc5e3a3b33ce73374715f3be97367caf402
[4/4] arm64: defconfig: enable Airoha platform
      commit: e9340b4423db78a31ed156a92af9eb2fd7df9456

Cheers,
Angelo


