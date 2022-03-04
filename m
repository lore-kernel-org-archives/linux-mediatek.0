Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A17C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5DfxiLfX4SAQX338b25I4Mpx4rwl+0dy9bNFx0WEcs=; b=VLjBtlQN5x69VJ
	D0ddsI1wVBsU+PTZcSgDWxWO710ss1q81XkBQnVlzhhp9zlv524k8f27zt68cRfTe0JmQs5lL04ry
	x/Z8s9oMTIdP1FR/+nuaN3iv6iDilxiAo+w9AccUEO1NgVCsykriWk1XIDLvIwWgW5aG2op3P4kzq
	mb7igNXTcUvGdUOkhP3+iHNR8NV3Ebv1vEGMcNPdOXhN1r7vZQ2YuzWV0FTgORjywE9x0+PXSFQSS
	Af9Y5cpuNuTunCDriTxvHN0y0yEhVuUIS1P/bRhFtyL1QUEGesZ8ljtaaGdTUT0H51WJ4lRQMkaSB
	jrJPmxlYUk1rDKjr7a2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQH0O-00CGaO-Po; Fri, 04 Mar 2022 23:06:36 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQH0L-00CGZ6-Ob; Fri, 04 Mar 2022 23:06:35 +0000
Received: by mail-oi1-f177.google.com with SMTP id ay7so9357010oib.8;
 Fri, 04 Mar 2022 15:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ATA11vRf0zeVLMjaFmKZ4cxLi5HueUdNVm0c6ug1+pQ=;
 b=LOsXWbqONhNXqPc9A8yk1rlAR5SOP07F9CqhOZmqeJqyXGXhG7MPsma+wfD9aMFJ6e
 gV/WPM7KQLphFsrQThW4Sc+r+kssD6tACRnF7R7MC7xqsS0PUi04gLCH+COE3vyg5dfo
 7jbqPrcCPElDyQQV6g3LqLjFl8xJdxMK+fPzGLOP4YjNcY5Gu47zbPRMcbijmYsLSPvD
 HAG1LCa9LwuPQVPlm0AcmUPh6y1arm++jWj1h3NqV7uxoNSTfOUNl+9E7Ijzwh7y6eas
 lslqbTvUobkXQvlIyoLIATpLTpk6joi1byRr+1tEqdk0+Mg0rQHpnG4lLsIYpW45N/lj
 q2eg==
X-Gm-Message-State: AOAM530KenLb1T12uMpeLV/JZXvESUiaG7CewrQ6bfgzIDR+ufuZMEOh
 M67NybJyoP4xG2iY11iYKg==
X-Google-Smtp-Source: ABdhPJzdp9EJcfPN5djd1vxXYjKLskxK/4pozXmqkHEOZkKsqdM4MGm2KnaauDBCC70eUdFaJv6PJA==
X-Received: by 2002:a05:6808:3020:b0:2d7:2d3d:b651 with SMTP id
 ay32-20020a056808302000b002d72d3db651mr11024147oib.139.1646435192431; 
 Fri, 04 Mar 2022 15:06:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 bc24-20020a056808171800b002d722aead50sm3215928oib.27.2022.03.04.15.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 15:06:31 -0800 (PST)
Received: (nullmailer pid 626767 invoked by uid 1000);
 Fri, 04 Mar 2022 23:06:30 -0000
Date: Fri, 4 Mar 2022 17:06:30 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND v5 1/2] dt-bindings: remoteproc: mediatek: Add binding
 for mt8186 scp
Message-ID: <YiKbdtiLHDuyOmL2@robh.at.kernel.org>
References: <20220225132747.31808-1-allen-kh.cheng@mediatek.com>
 <20220225132747.31808-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220225132747.31808-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_150633_821441_B3BFD734 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 25 Feb 2022 21:27:46 +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> Add mt8186 compatible to binding document.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
