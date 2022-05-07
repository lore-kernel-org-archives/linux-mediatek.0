Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B66C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EUfDKxMMpaQ9CPqZ1hulOY7h1YsLHmPWcAI+Ul5jx8=; b=PZmm5+/X8uSBuH
	lcklbAyNn/Md7n9qorNWvBzqJZQSMjkm7cWB3BGCnvrvxjqBr1w0TfdBpC+rUx4pQ4sJBfv2JzNue
	nQZ8XLAIjPYn+VQmkNMEYfnTnSoj1yShx9sWSbtgpdEkHVBTPzh29OghkGVn7A4kJzbM4OceT2Tx+
	/sF65rRg7AYrSmAArnHIT1mzN9tAiVmoTucRdPQkCpfjGkx8t0Du2N8ASqS6CYcyynOyzwxVIBOSx
	6MKCVcOMaodXLuBTdoiK31cKP4VWKfN4xw9eh3gChZAaUzACR3VC4u0v/hsCL2bRuSxyY9NCy1wtx
	gY6Xof1HDS3gjFr0H0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnMTR-007Yfj-QV; Sat, 07 May 2022 15:36:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnMTF-007YcN-RX; Sat, 07 May 2022 15:35:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 727E4B80AED;
 Sat,  7 May 2022 15:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C79C385A5;
 Sat,  7 May 2022 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651937746;
 bh=5JdWStqnLHVOx/3OlLYMVcxQ/dWOc4viCFvQaLtKBWM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pjBDxRKcm19ggHCT3GT0gO97hf7JMvQEn4r8VlkDTogfba8iz4MuCfZLMDAuvQCQ0
 Rg4G0dHTJIK+zNkhSLi7AI9kK/HSudOMYkBii0A02exRIRv1UZdZT1gOO5FtS26TK4
 r1geeG28gGHRgxOuQWB3YgHUSk06tt7cDV6EbXQF0/xr0HhqyNbzCU18zmWJ2JJGJm
 oz/gj8GbeCU4cmUMNaR9h9LyQej5J19zUGknAOv+gI4L8a8LaTZJEZ8KKOIGYxxpFM
 1xtTKnqMAXzRXuT8t90mEjy4OATW/So6JvefbePD5upGqf4oUM2uBMmKG9ZN6MmF7s
 +gtKvGrUVV6XA==
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2f83983782fso108028217b3.6; 
 Sat, 07 May 2022 08:35:46 -0700 (PDT)
X-Gm-Message-State: AOAM5305cmbgaqyvJNP1zWTk4qX2xbc/vDxPcCA9o9XjM5RJjMpheFJ+
 j0VRnp7zevY59QkzM/f6jy57cMM/jhDyzDr1UQ==
X-Google-Smtp-Source: ABdhPJwDhtthoa7AUtDJmXtXr6BoSIIvTt63knY9cK0lyKPgCmY+/9linfuCKIw9ocYEdDjBwqTrr0a8d1n7WjOKuDw=
X-Received: by 2002:a81:3214:0:b0:2f4:dc10:33ba with SMTP id
 y20-20020a813214000000b002f4dc1033bamr7214015ywy.3.1651937745103; Sat, 07 May
 2022 08:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
 <20220504115501.3490-3-rex-bc.chen@mediatek.com>
 <7a4e7d71-4460-21f4-35fa-d3b11559785b@collabora.com>
In-Reply-To: <7a4e7d71-4460-21f4-35fa-d3b11559785b@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 7 May 2022 23:35:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-5QLEYyqqiw6WtepHrykXJgatUyxLMYU+61P-21CBVZw@mail.gmail.com>
Message-ID: <CAAOTY_-5QLEYyqqiw6WtepHrykXJgatUyxLMYU+61P-21CBVZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: mediatek: devapc: Separate register offsets
 from mtk_devapc_data
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 krzysztof.kozlowski+dt@linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>, runyang.chen@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_083550_083963_0ACD554B 
X-CRM114-Status: GOOD (  10.05  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4g5pa8CjIwMjLlubQ15pyINuaXpSDpgLHkupQg5LiL5Y2INDoyNuWvq+mBk++8
mgo+Cj4gSWwgMDQvMDUvMjIgMTM6NTUsIFJleC1CQyBDaGVuIGhhIHNjcml0dG86Cj4gPiBUaGUg
cmVnaXN0ZXIgb2Zmc2V0cyBpcyB0aGUgc2FtZSBiZXR3ZWVuIE1UNjc3OSBhbmQgTVQ4MTg2LiBU
byByZXVzZSB0aGUKPiA+IHJlZ2lzdGVyIG9mZnNldHMsIHdlIG1vdmUgdGhlc2UgcmVnaXN0ZXIg
b2Zmc2V0cyB0byBhbm90aGVyIHN0cnVjdHVyZQo+ID4gIm10a19kZXZhcGNfcmVnc19vZnMiLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5j
b20+Cj4KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
