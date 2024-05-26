Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF48C25B75
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 May 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O52609GRv3xD7qw3vqEPMnovBck5Z0eCo6hQ6lSwaUw=; b=OO+rw4olf5tDGpaFcoNLempBEN
	PzqG1Sn68OaI039pwynbpDP3eAQ01PgzY+Jz7EHU6fmQYdbhfYRkC1ldx2BtfDdAtHPQpRw4d4DlP
	z5/6OO05wK7R9eYBmUVm/fww+JB2WT2BI4+SqyZNZSmoXPYkz3+AwTFW9riewe8idd5ir7RBjngQk
	80iEgmiGg0hf0iNUVxHm5idSYf/v4tIIG40/wulj3DIUAY3UmTlG8fUkjZ7qnBPrn8CMGBbK9QsnG
	O6ZnbycNwoZNHJDSYbPMbv1tUFRQryWXgPwYX+7Hjfn0ea6rQ6v3dgEe6h577WfFsu4RAgU7TBMlR
	IYASodIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBGVI-0000000Cv3P-0MqX;
	Sun, 26 May 2024 16:13:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBGVC-0000000Cv1L-22I1;
	Sun, 26 May 2024 16:13:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70F2DCE09CC;
	Sun, 26 May 2024 16:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA1AC2BD10;
	Sun, 26 May 2024 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716740019;
	bh=leD2S7lpS8n5EdWPOzT2u2+2bVeUmpHLgfDZY3EfIow=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=O/92gJPIjF8h703XZyIrycQN5bhPIfL5bQPmr5DgAPmGgDDKXrDPq3vHLNjXDStd0
	 l10/ktzrPqKjDKHqMg4GWoUDdHxvgaO3Pnz6tjcZ60AQoCqOJI+OglswsCSq9H5VDU
	 pQE5xbgDrhCCfMazsLYfJ+zBFbVqxJtT3Cr3Z+Y4uPM5zbZANNuNImzGPhnhtQbWNy
	 dhmwoZAL8e2u77Y/GHbDEXe9gUYuisBnZ4f8a/Lu+SGKsjU8i4/Xekz5h54CXXSIHr
	 Q1dAgnBD3YzA+U2VPioe4/VqTLziOGyMeTdf/JpXEQ4PbJH6NMbNyp1yAG46C/gFNQ
	 rxMLI9nun3CQQ==
Date: Sun, 26 May 2024 11:13:38 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Singo Chang <singo.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Nancy Lin <nancy.lin@mediatek.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jason-ch Chen <jason-ch.chen@mediatek.com>
In-Reply-To: <20240526144443.14345-3-jason-jh.lin@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
 <20240526144443.14345-3-jason-jh.lin@mediatek.com>
Message-Id: <171674001829.1684465.16088341885457355919.robh@kernel.org>
Subject: Re: [PATCH RESEND,v6 2/8] dt-bindings: mailbox: Add property for
 CMDQ secure driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_091342_913829_E4AB38A4 
X-CRM114-Status: GOOD (  20.75  )
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


On Sun, 26 May 2024 22:44:37 +0800, Jason-JH.Lin wrote:
> 1. Add mboxes property to define a GCE loopping thread as a secure IRQ
> handler.
> The CMDQ secure driver requests a mbox channel and sends a looping
> command to the GCE thread. The looping command will wait for a secure
> packet done event signal from secure world and then jump back to the
> first instuction. Each time it waits for an event, it notifies the
> CMDQ driver to perform the same action as the IRQ handler.
> 
> 2. Add gce-events property from gce-props.yaml to define a
> secure packet done signal in secure world.
> There are 1024 events IDs for GCE to use to execute instructions in
> the specific event happened. These events could be signaled by HW or SW
> and their value would be different in different SoC because of HW event
> IDs distribution range from 0 to 1023.
> If we set a static event ID: 855 for mt8188, it might be conflict the
> event ID original set in mt8195.
> So we define an event ID that will be set when GCE runs to the end of
> secure cmdq packet in the secure world.
> 
> This can reduce the latency of software communication between normal
> world and secure world. In addition, we can also remove the complex
> logic after the secure packet done in the secure world.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.example.dtb: mailbox@10212000: False schema does not allow {'compatible': ['mediatek,mt8173-gce'], 'reg': [[0, 270606336, 0, 4096]], 'interrupts': [[0, 135, 8]], '#mbox-cells': [[2]], 'clocks': [[4294967295, 4]], 'clock-names': ['gce'], '$nodename': ['mailbox@10212000']}
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240526144443.14345-3-jason-jh.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


