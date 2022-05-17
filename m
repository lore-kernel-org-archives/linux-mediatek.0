Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06454C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhjRxhPaZZPi8+rIxguOhqLJdIA8VaWy7eMxKspIvHg=; b=sD419EYpWrIEDe
	+Zu4uvFkSczyNn8LxTCJOFSO2tMLDimrLixKup+usRpdXZ4YRfrT/bo2r7u8JtKn0fnL7y83iJL50
	qlnKY4rkfzKJqdVAeecGa8tomKR5WVNWc+TQQUT7dCF9rir9IiynPoW+FMIaKCK9yNylHrV4imH5V
	ffLnoTN7HRZ/2pacoj5B2ZOOwEFXm9MbyAQh1FWPZ8NxkjyneTClC1xEkCLIFrEFB9vy+FBHCSkc8
	ZJagGzjKMkO7NctV/ZcPzL7lceejGCPOWCCS3OvrPb3YjJbBAXIj4XeIxPlYqa6ZAL20ByxNMxDeu
	Q703NzPG+Hw4D8ZoHBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqt8A-00Ce0h-9R; Tue, 17 May 2022 09:04:38 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqt7r-00CdtY-Mv
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 09:04:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id k30so11093361wrd.5
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 02:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BD63j2HpRLVuVqfGZEYfIBf5UOk2z74/MiITtatEVYY=;
 b=qAorOprbtPfV1b3pNa2UAWKB8p3iJPpS6OPxnRet+P/pISt0J0679h5riWvP3JknqC
 KNgJIai5H2dqh5GQEfo3KtKmjv5XcRdmbnVWVGRSeZv9QWuKDIbs4BP/+FbdA7A+Kwo1
 ciguiYqws762Zc6SVDXDa39jID2pE/SPaC0+8Jr1RJmriexFZ04MlAou0f+YbSjrTfFj
 PEPucdyzzd5s0tQKiZE/XjkNSdKSi3fNQ5tTP48utatjP/bnilJyzE6jMqGJVq6cboTr
 A8D7ILm6yS5KXRAo8J4xXjQoI0WaCsxCli5KJE5zzebFaXU5x1ozr5S/+mTvO6FDVb/e
 0HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BD63j2HpRLVuVqfGZEYfIBf5UOk2z74/MiITtatEVYY=;
 b=wfNQhlLi7po3bYlMWJ9MwhbUUnmV5F4/5ISUCzXl5QFE+5+muXXyt/JNRpZOtj2K3r
 T5zVdd0el7l5eTyQOm7aE1WlWaq1wNJB4E8nYWfPKFPj0jZbR0PXqkrmuKv+xryIUF5i
 dg7LTou/wFdDmXCoxWru4qUkJt2s/wPNWZc9oqykxg2c2xjZjlTtDQRwaRqnBxLA6/8F
 vYxY7OGxXT2fhgr16uixeNqI8M298u/ARzY1uKc9SbKDxl+/h5WX8LcJjLmnWjVlrl+0
 SSEj39y9kr4kGDnG4a00tsSgHkKM1UOLPCqIEKbqam2DLpx5Az4zjJK2PCcWpREwOQG7
 GCjg==
X-Gm-Message-State: AOAM531rrHeTDAgg1Wnv0eXWZgZbg30MtQFUWFwO4fdMV0yi9ES8uyD/
 xYzNBFlebYiFW7IU73tATGiLZw==
X-Google-Smtp-Source: ABdhPJzUela18pWzJFpYz/kj0jG1AUrEkLuAYkMqxMW/Vpo/UasSs3xIMnmYVMQ+OQrGfUJyatolOg==
X-Received: by 2002:adf:9d89:0:b0:20d:e97:1640 with SMTP id
 p9-20020adf9d89000000b0020d0e971640mr5337204wre.441.1652778256340; 
 Tue, 17 May 2022 02:04:16 -0700 (PDT)
Received: from p14s ([193.117.214.243]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c26d300b003942a244f35sm1283224wmv.14.2022.05.17.02.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:04:15 -0700 (PDT)
Date: Tue, 17 May 2022 10:04:12 +0100
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Mediatek SCP dt-binding tweaks
Message-ID: <20220517090412.GA34828@p14s>
References: <20220511195452.871897-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511195452.871897-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_020419_811954_9AD2178F 
X-CRM114-Status: GOOD (  13.80  )
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

I have applied this set.

Thanks,
Mathieu

On Wed, May 11, 2022 at 03:54:50PM -0400, N=EDcolas F. R. A. Prado wrote:
> =

> Two simple patches for the Mediatek SCP dt-binding. The first fixes the
> reg/reg-names property while the second adds a new optional
> memory-region property.
> =

> v4: https://lore.kernel.org/all/20220506213226.257859-1-nfraprado@collabo=
ra.com
> v3: https://lore.kernel.org/all/20220503211114.2656099-1-nfraprado@collab=
ora.com
> v2: https://lore.kernel.org/all/20220502192420.2548512-1-nfraprado@collab=
ora.com
> v1: https://lore.kernel.org/all/20220429211111.2214119-1-nfraprado@collab=
ora.com
> =

> Changes in v5:
> - Made l1tcm optional for mt8192/mt8195
> - Greatly simplified the constraints override in the if:then:
> =

> Changes in v4:
> - Reworked presence of l1tcm reg to be if:then: based and present only
>   on mt8192/mt8195
> =

> Changes in v3:
> - Made the cfg reg required again. After looking again into the mtk-scp
>   driver, only l1tcm is optional.
> =

> Changes in v2:
> - Dropped type and description from memory-region since it's a
>   well-known property
> - Set memory-region maxItems to 1
> =

> N=EDcolas F. R. A. Prado (2):
>   dt-bindings: remoteproc: mediatek: Make l1tcm reg exclusive to mt819x
>   dt-bindings: remoteproc: mediatek: Add optional memory-region to
>     mtk,scp
> =

>  .../bindings/remoteproc/mtk,scp.yaml          | 47 +++++++++++++------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> =

> -- =

> 2.36.1
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
