Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8813C47E49
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yF1vj6bD4OantSklaxQBfzwibMkOXYYkC5p2/Evicfs=; b=gUx41kjIrM7R+hlFr9G9VjUqe0
	iT5AcbFbO8hwl3kXMREx4C4ti5Hm9AX/l2TR6SpoP1zYNTjROSrvuCu8ptjWbx6ZLgNeLFEy7IEcz
	ZX3dz2aQtIURVJByNJJn7xJ9d5XWoHizPoYm59q0KOQpkziEZNWE05uaRY0NcuNGQD5CQHjyV+c4E
	Gn2TMaNB/vwgBCPDLKTJ1PoOENVUpsYaTeOmxpv7f1e+wCMP9EzMHprIw6ww/WngP7zyo1PQDvUOY
	QrLsjjqsksqcXicF2bOzBuXp3Ihz5Yx2v4K8xeDuEdLjNVElOSqiC8L9F0GHBZniT/XH18yYZ2PUh
	QoMuGl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSw4o-007YjV-1h;
	Thu, 25 Jan 2024 09:31:14 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSw4k-007Ygz-12;
	Thu, 25 Jan 2024 09:31:11 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so7849910a12.2;
        Thu, 25 Jan 2024 01:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706175066; x=1706779866; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yF1vj6bD4OantSklaxQBfzwibMkOXYYkC5p2/Evicfs=;
        b=lRtUEQ/yU5mOIKvTDjvI9i9/7uDOA9MeWUHhzIlooSriSdr7gJPLxOAlgg4VPQZZes
         M1KC4QKIbPfJ9NV40sfDsJTONZTlw5+nlnzzdyRMZq1sJXDxwFYqSzM7iHBEhqjvyaTv
         59B7FgwYP7lcfp9EoNBSrrqqxvQMWY14whVGtHcj3J36wzUhoMbJV1T55UPXtTDxd6JU
         KCNOp/JMzSrqbR4V33bj+BdFcNRhB9rUTT6WD+7ZLZJIKSm4gnN7uMpgcWsDcvj9SeCx
         CIDr6aNj629oBlNfUAAejiy+ZuCg2uE9U/5sp50Rqtsg3EYcsrAun4DPpNO9C1B45D85
         npYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706175066; x=1706779866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yF1vj6bD4OantSklaxQBfzwibMkOXYYkC5p2/Evicfs=;
        b=nKuO/KhENGAPc55VRiEgD4dIs1ph/ZM+rsGbuiQPUUD2v1Kpq8Jp92RnTQVXsJcc3/
         bS9uZGBbD8+EAdHg3reemCZm6BHhijLRGnKtj2D2QuvugGWm6kL7udNHADVdujRkmefO
         eB5G4DkqttH9TTXz0u25AMM6NSLimDfc500q1n/npmoILPig7C8IkQNaPU3HujeRYl7f
         DUMW9gvsWFq2ppPSQdFzwEziB6ao4TedwnegQVRAOhXsgj7WgD5ONFPzeBJFQHXeACEZ
         RgmOXj0Ui3j8XHL7LsA8lCj+QJqMdaHzRAcXblJzW/2MBLtL/MEuHkU6tNACoxLkA48+
         Fo0Q==
X-Gm-Message-State: AOJu0Yw8z2Ic+0dKyfI6RJdF2GcNnAVDnZdNVG/0BCHRTUcrhz442Ktx
	0eEGLBRhNvwQzvY23lW4A0gRdMlgu0ZC25tengA5Z8Qiozp1WPAm
X-Google-Smtp-Source: AGHT+IFD9l2XpZg6gJ3Y5v2cAtGMf4TOPGAa0HvVrsoqEDBhW3/sdNPJABjpXIj+kn4fncD/5XKE+A==
X-Received: by 2002:a17:907:8693:b0:a2d:d05e:5704 with SMTP id qa19-20020a170907869300b00a2dd05e5704mr456600ejc.30.1706175066341;
        Thu, 25 Jan 2024 01:31:06 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id k14-20020a1709065fce00b00a28aa4871c7sm809849ejv.205.2024.01.25.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:31:06 -0800 (PST)
Date: Thu, 25 Jan 2024 11:31:03 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 1/7] net: dsa: mt7530: always trap frames to
 active CPU port on MT7530
Message-ID: <20240125093103.xlf46pezqj6d5ij7@skbuf>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-1-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-1-042401f2b279@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122-for-netnext-mt7530-improvements-1-v3-1-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-1-042401f2b279@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_013110_377631_41AF595D 
X-CRM114-Status: GOOD (  15.80  )
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

On Mon, Jan 22, 2024 at 08:35:52AM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On the MT7530 switch, the CPU_PORT field indicates which CPU port to trap
> frames to, regardless of the affinity of the inbound user port.
> 
> When multiple CPU ports are in use, if the DSA conduit interface is down,
> trapped frames won't be passed to the conduit interface.
> 
> To make trapping frames work including this case, implement
> ds->ops->conduit_state_change() on this subdriver and set the CPU_PORT
> field to the numerically smallest CPU port whose conduit interface is up.
> Introduce the active_cpu_ports field to store the information of the active
> CPU ports. Correct the macros, CPU_PORT is bits 4 through 6 of the
> register.
> 
> Add a comment to explain frame trapping for this switch.
> 
> Currently, the driver doesn't support the use of multiple CPU ports so this
> is not necessarily a bug fix.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

