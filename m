Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38B9C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 06:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgB1JIhvuY/BO7MAAZPSEqht3ry2nTR4m4F5uYSapxc=; b=kS4zsiIPT6PfXY4cmHXU5WfTkJ
	dgIg1J1YA0MFZ0s/8dD5o13K62jxphtDrbVnqSRWkCkIlYknnK8Uw/axQPDdgDDOhIQkd4rfn9Ntz
	NpgfoQd6vxkc6gSNKgvp1vaUvz1N5FZVyldQiaYddpaMKTUAtE8KnkWNOHdjsAMAjthzRPa4ZtZ4l
	NAFihJU9bTOE2CsI7U/doPRiWvKXgv6yViF31BHkMYR1hB9vLfS2XtCS/fY5Us/MHmn8pXR/m8xPg
	ZFih9NLFgTV8flWc4fdwrMCRTEwauAonBGx58JNdY3owWEl9TDhpU11XB3niqRj2LMYIHo+TnAAuZ
	oGdHkw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rti7u-0000000ESzJ-08i7;
	Mon, 08 Apr 2024 06:05:06 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rti7o-0000000ESxn-235D
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 06:05:01 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so4702387a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Apr 2024 23:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712556297; x=1713161097; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgB1JIhvuY/BO7MAAZPSEqht3ry2nTR4m4F5uYSapxc=;
        b=BJJl/4xEHh3fNV/B6Yi61sv8bqJ4nol/lLd5Gf/LlOW3/6mQ/flAj2HCl+RhBrTdhj
         5roVVw6QoWxuWvimu1UE/Ncn3q01ZVDKA0NG3CC3win86a/D9WnOWmheXrrQHBB/idcS
         /R+3uB8zESqQqyfJzmIGA+LP4QhmH7jWCE3M9L0R9KbDjN+/+hLGbGg5HBDFrM+0H9Wi
         IwJAdP4RGVFiVrY7jLy0z+nD8rjj/RUOLTXi0c0BajZOv6yxtxL/dBtl4FUC8CbxwtuV
         ez8d9q+8tA0di8EyRS6H78+VBfodqGSiqK99WfUn8XmJhW8EZXMx/9HEeRFSvbEpM4Mo
         UmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712556297; x=1713161097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgB1JIhvuY/BO7MAAZPSEqht3ry2nTR4m4F5uYSapxc=;
        b=jhyz+c0+sAlUDj06r3vtUfHU+LwZgB9nfZIZhIEY/nEomcpyxzeYM+j5bLJRQa6nn6
         su6+SrbE9txJJl56Bt7b4hPAYAmuLwZUBun7Vk92nQyuxqOCCEZMvfLyfJVqphc1x/RO
         gzlMprEr4Djs0s9OKp2S9ubk0enZqYbqaGhYXLC7EnZiq2xz03NXciTVnkY3j3gYSbr6
         Gwd3OLs/oXgZAS/v4vJ/tOnze8TmqOUO7DPGvtsyOK1OlmWyJiqy7tI7cZwZx3uiyVCQ
         P9viEElHWxSEc/0qXysyh/Mkspdgn8kxJ1z5MOyZ3cqOG0UsAjBXzxJh9xVA98TFJxpL
         jBCg==
X-Forwarded-Encrypted: i=1; AJvYcCUu0aymAWim6bp2q0sTOeWLSJWWOC+0Q42/5Y/iKuQs0RrAookxDTMGd3tkgejqNb+1+dsd84AdjWJoqOjPMzp1avVKQMLz5x8HA/uKlGTM4eYb
X-Gm-Message-State: AOJu0Yy6h0Sq27swaGeTyseX/+S94XABhL0NwsiB0OBVwHAa4tCC4Dst
	1ZJ7wajjSPAdyFOr2TE4VUbhXXzgkhwDXGJOowfIuraNaFUt+Mk6T+86fuQRZTM=
X-Google-Smtp-Source: AGHT+IFDXy3tWRm2lGYd0E3HusgZ33A7ZYQowDKLk1RHjwU5BYJRl0sgFa686Sl3jgUpELE1zMqbzQ==
X-Received: by 2002:a50:871c:0:b0:56e:2e9b:1341 with SMTP id i28-20020a50871c000000b0056e2e9b1341mr5971901edb.38.1712556297079;
        Sun, 07 Apr 2024 23:04:57 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id di19-20020a056402319300b0056b7ed75a46sm3764632edb.27.2024.04.07.23.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 23:04:56 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:04:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	David Collins <quic_collinsd@quicinc.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
Message-ID: <ZhOJB8o9cRr7oQU8@linaro.org>
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
 <20240407-spmi-multi-master-support-v9-1-fa151c1391f3@linaro.org>
 <fkwugrnak3fhkg5ig47kmy3edm45ut4dprkabntnwemjt3w2mb@7cak5zxwzw4p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fkwugrnak3fhkg5ig47kmy3edm45ut4dprkabntnwemjt3w2mb@7cak5zxwzw4p>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_230500_588351_3DD8EE6F 
X-CRM114-Status: GOOD (  17.45  )
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

On 24-04-07 19:07:03, Bjorn Andersson wrote:
> On Sun, Apr 07, 2024 at 07:23:21PM +0300, Abel Vesa wrote:
> > Add dedicated schema for X1E80100 PMIC ARB (v7) as it allows multiple
> > buses by declaring them as child nodes.
> > 
> 
> But is this really a "dedicated schema for X1E80100"? Isn't it "the
> schema for all multi-bus controllers"?
> 
> I.e. isn't this a "dedicated schema for all platforms starting with
> SM8450"?

Suggestion was from Krzysztof to add platform specific comaptible (and
therefore schema). Since the first platform that will support in
upstream proper multi bus is the x1e80100, the schema needs to bear the
same name as the compatible. When support for multi bus will be added to
the other platforms (including the SM8450), they will use the fallback
compatible of the x1e80100 and will be documented in this newly added
schema. We did the same thing with some PHYs drivers, IIRC.

> 
> Can you please use the commit message to document the actual reason why
> you choose to create a dedicated schema for this? Is it simply to avoid
> having to schema with either pmics or multiple buses as children?

I can re-send the patchset with such a phrase in commit message.

One of the early versions of this patchset was actually submitting a
generic compatible for multi bus, but I remember that there was a
request for following the platform dedicated approach.

Krzysztof, can you please provide here the argument for why that is
preferred?

> 
> Regards,
> Bjorn

