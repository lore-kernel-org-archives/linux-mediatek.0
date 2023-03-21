Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C3BC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnJYCIHb3YOLk6h7F2Xo1WPCj6zYYjtkpvkZ8wpoQJs=; b=IKG/cT92iyyobFFg1VH6XPK/xu
	s8ypfB+C4GdzBWxNFFuL9Xgsd9SLk2x1V+puZtT+KPV7Xswa09PNgX4sbo3zNkOBHeVZ8jVubCdME
	D+Lj3WcOn/+jaERitB6M2MgQ74t05MjxeUgAOsk+hkua+FQTtNyqjKfoJAwdqGRrUBtwDTL4bZvlg
	6UONzaQW/9/aTsFFihnyYWcxxlMnUmgqRcfzqjHzAoZGScOHgkVUvCuHGOlGsrYiqldjpyaNHDE5d
	tLkyndLkEgZ/O7esKk++3xC6bNyu6bXSLrVNAPHQDnNwKLl0rYT32pIK3nHE+kkDXP/H6FXI9FxPM
	150sI9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peimb-00Dixd-0s;
	Tue, 21 Mar 2023 20:40:37 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peimR-00Ditv-1L;
	Tue, 21 Mar 2023 20:40:28 +0000
Received: by mail-yb1-xb34.google.com with SMTP id y5so18802488ybu.3;
        Tue, 21 Mar 2023 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679431223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnJYCIHb3YOLk6h7F2Xo1WPCj6zYYjtkpvkZ8wpoQJs=;
        b=jLlwwP11Eqd3QcuN1GuSMsYw65pUik7rYOLx5A1BPNTMKYJnucTWfSjnqUytJNHQXy
         GlAFJL6HyR3XP707iPGwPLT9NY80fMZ/hCISBwSyJBwHfz7eX+lK3CL2OIHoNHXO5Kyz
         no+vIz2/4ucVrHHNXkTOmblHIkWNlzdaISIxpB3ZjQRTD5u2I/FgqtMhRgiy9YzTWTcX
         waavRaNlKiFGoog+iFNJImDr8t2BuR/0PLfTa74EW/SK1wMrTJ1l2qBB/fA5N5Y/t28Q
         /rPFIaJLKvcae0dQ9PRxX/RisjwpluW3tmFgSdLMjx7xzAexmNpGqZa2XA5/3IwG7ffU
         1+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679431223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnJYCIHb3YOLk6h7F2Xo1WPCj6zYYjtkpvkZ8wpoQJs=;
        b=df+u4nUSqos5nSEccyORFJkWbF5xyTS4rbtWd4UvCc1O00yTvrD09hmPbTyr3XlSbe
         a+0ZQxZh2FPKNc0I1EHlKCDmC25rYygjrED4UJQyMgXTVAj8B4JMPe7nmyofIE7Fzl8W
         OObT/I33Sq9+7fjwDSkA9ZTVY6N+Wk6Z0KSjk+ijtS+radSOs0zHCIFHPzQuqygTC8aw
         10GWJBheMTOTZNPsKpFCafzyNHqLUH2xpy9iIm+Z81MnS1ZyGO9iTXRE8b6w8kZ8foDG
         F+g6L30SI8O8mTAFSI75XIy5O/u7jS838Zfoi6tqQaM5hLc4cKXivjXNgyz4b85NDc1b
         quSw==
X-Gm-Message-State: AAQBX9fmNH8LFt/olpKj9sIHOznSeuReRi6cVzdjiblVWcg90G3rX7r7
	r5jPYVHGhEdE5Av3JlxDDVKc02IbCIn6PwDmZdI=
X-Google-Smtp-Source: AKy350Yr0lFcvlrRV/aUYAmitKBlF/YIDHoHGNgfQJQ9fN+jGmA0gMeojAbcNNdTi/SlMNF7cHZPfM6jxoOO65XX8gM=
X-Received: by 2002:a05:6902:6:b0:b5c:f48:3083 with SMTP id
 l6-20020a056902000600b00b5c0f483083mr2322649ybh.11.1679431223686; Tue, 21 Mar
 2023 13:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230320233823.2919475-1-robh@kernel.org>
In-Reply-To: <20230320233823.2919475-1-robh@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Mar 2023 21:40:12 +0100
Message-ID: <CANiq72m+cNuGiU_J9xU9QKmQK-ncD=1Y5imskrFNFSezzmjq8A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_134027_479868_E37FECA7 
X-CRM114-Status: UNSURE (   6.26  )
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

On Tue, Mar 21, 2023 at 12:38=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
>  .../bindings/auxdisplay/holtek,ht16k33.yaml   |  2 +-

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

