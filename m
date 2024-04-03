Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59324CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjs8Utuzc4qquZ0Shnb5skU4tEIO6HJP0DAeknT+q1U=; b=U74EFesvDpBm0Mu1xO5rMBRYS+
	YGaOiuMdWU8SJo3p4HzXrzIKT53mIlAclc75qs/cS566usAeAQbf7a9jHpviR8m96hk8TcxMlnfrH
	jFXeMLSUMVGeiguHQPfe/MHeqda4x9dL0y4dqAL/Xz8rQowT8NaQqQdYvLga7HneY3Wz6I6Jusc05
	E3pDNrn1cYbkNdube5paoBIe/p6ErdVMIjaVDa5o6PxkKHpYkxiBGLWL81kOwYxPvODPv7JaCGVQ5
	oJS0ZmyxO2q7RQ7fQWENdBNMPVDBFmiPfL1ih0Fd/TIwXtLtRVCvA3WnNo3Imw1HJne3+v9LTEpAp
	nfAmo4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrz1W-0000000FpV6-3Wgy;
	Wed, 03 Apr 2024 11:43:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrz1T-0000000FpSi-11zC;
	Wed, 03 Apr 2024 11:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 90CF3CE237B;
	Wed,  3 Apr 2024 11:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FFDC433C7;
	Wed,  3 Apr 2024 11:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712144594;
	bh=uUHgwO0eFmALyzsBaJSjObTbbmjZmMw7iBv8Z6hkKtw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RG3oDw8ySAE5dM+cSAA0ris3Tj6dPYKvg0w1ScmsbSKyBWAgkCtvHku6Vy/0Z2ar4
	 T2DN8ENe9NPXgT9aTfgI/ounBnDrAoxtq74TPAidMEpr8SGE82Rbq8rN9z4vQ3wSG9
	 XoRvD52h1tcP8d7avJdAoN8VSE+HAQ1YEsj/ezXNaUyrH05GC3J/MHuAoK/Ny/kH8S
	 EvZfwycYEnVR7CKQcB8X6iKz4QMTzbpfhZqh9G2cX1D4rwLNkt7mGXJFyWUqP37Q6B
	 RheIaI8B8lLi1REp9a/tGk/f7LCr4WYk3BE7vFcXYzGufqdEjYtRTuN9deslSeCWOk
	 LaGzHKDF4woPA==
Date: Wed, 03 Apr 2024 06:43:13 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Shawn Sung <shawn.sung@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20240403102602.32155-3-shawn.sung@mediatek.com>
References: <20240403102602.32155-1-shawn.sung@mediatek.com>
 <20240403102602.32155-3-shawn.sung@mediatek.com>
Message-Id: <171214459243.3102045.9648792488984765455.robh@kernel.org>
Subject: Re: [PATCH v5 02/10] dt-bindings: mailbox: Add mboxes property for
 CMDQ secure driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_044319_490240_F4CE4569 
X-CRM114-Status: GOOD (  11.69  )
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


On Wed, 03 Apr 2024 18:25:54 +0800, Shawn Sung wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> Add mboxes to define a GCE loopping thread as a secure irq handler.
> This property is only required if CMDQ secure driver is supported.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml:
Unresolvable JSON pointer: 'definitions/uint32-arrayi'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240403102602.32155-3-shawn.sung@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


