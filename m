Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73F2C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=; b=hh0YYEMcpbevj0CuB+4G5LaqjO
	uOccp6/5J2Jh0Zqi8cs6+pOFw8ZuYk0AOtkeLL6fiaJdczscRU6V+ZpEF9QZkbfDZB45sqjnjqkFQ
	org6NCHKdRqI8agCYRQ3XwjeY4jo1H3k+ekfjc+A1anMcEQ0GnbfJBIFpw5UDseB+DMgp0/zQs+M8
	CUzplAvF0NnebLTPX1LKdEFBsKMNPVN4XPe1WVYSvV0urISO1rZ6RTRdgZPshcKGtMGF1nwpeEUDC
	K/f24nFXi4rqVoEYcwkE8rsswk+BpwOC8RHC3qai0NvA8mJqIa5iJX/WakqAefpsuXNydn5hS4bTw
	PCViSqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0hv-005kxn-1l;
	Wed, 19 Jul 2023 06:30:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0hu-005kwv-0i
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=; b=AZTD5wSbQygkz8XcJEu3l7RYcv
	hUvZjOwCxjxJ51akFSMi1ECkLFT84uUyFiolVu6mTL5QOI8OvMGRo7x/o9DCIMfzttCz4F5dxPv6X
	TSLTRDz/5gV3xAwCelT6O7rt/e5GcOSxaMpfrOob9wkGOA0uyZmcQvSgk7E/xeKTYjbbDS+6Uefal
	YbACpMGS/bxR9xLXCFSXGyGqPW50zVkEl48BVYF+S8Rhbp0oHprIOAQuj6k8TdRSa/RRRIJ+EDMtw
	GUKkXYBeDikuYPGWCijZ0+m8vYKWzQgfsRFvZLe0bbiR5rdVIiplfxkgR9dpr0qvKvNf3MVmrGT4K
	874WD2KA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLh1M-00BMRK-1a
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 09:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689672439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=;
	b=XSRk58CqELDeyBICO5ocx2/ao7rxqP+ad/3NDDwZ5XANUzzgcBv3+hs5V+k2+sM38oXERD
	gnWMLJhQv4kjXexZX1nmLoGkM4n+ggP6XZFeqftdh36RIzGdHmh+mRgcB8kHnqcfa/3r/U
	NrZPIyVsuhXvr9MD2w0+MOMGZH9Uxlo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689672567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=;
	b=TKqm12u1h4//dOgbKKa2m4u6x8F2AR5QuJh9lDLz9ZmRIe365j3iGxUeAmG/mrqTkvaT3L
	GbDdTzBWVxg/UFPB9SbmRxJQ3wx/e8KpVdmHhS8X1ib21NcshdTpX8d0quiH23o8J0n4mz
	QwDhBP7Lq8zLebVqZzk1r4oC5yCBXrE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-wc9RY4X4NXWfevDX89fqJg-1; Tue, 18 Jul 2023 05:27:16 -0400
X-MC-Unique: wc9RY4X4NXWfevDX89fqJg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-40234d83032so8393061cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 02:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689672436; x=1690277236;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=;
        b=Uoyw6FJT05CEi/VouGkxxkSpAu0VhpObllDuS0heY3IQG/TdATyskIwadAJaUC4j0v
         OmX63XtBiu4fkZtOwbCfWidaK1RFw89IH4IV/ghvs99vAklfM1FA5CtP4crQPXMs/xJi
         mfdTTnDwCVQHTG0Nm8b1bFEJ7zTHqDpmLwkSeU+wjASWm1UhSazjn9ByXsSnV6M1NrjP
         HbdPMEBgSwtdxuGZX/YB6EjkOj9OAXZc20XMSTd0uuCHa/pjKhZqaNSHIOSQQQUWTsVp
         xLN64EHxi3ysJa0VfWzuX41MeOwxVugUlvl1vBhjlAwbF8tlYj9HSkOH9atateKLglhB
         UIgg==
X-Gm-Message-State: ABy/qLZgwpT7YzXJSBh9LDM+OYfsh1uyMgzwvfx5U+jsIy/s1rPGy8W9
	WtZn+5cpFwQ5dez8dNTw4vj3d0eZbUrtCNIOpdHCVycvKI9h4U4+kd1Vx1wr+XMbnayHSBE46f7
	1v6c03XmxOJqappK1vfeW+xbApdLtB3z8
X-Received: by 2002:a05:6214:509d:b0:63c:7427:e7e9 with SMTP id kk29-20020a056214509d00b0063c7427e7e9mr12261355qvb.6.1689672436184;
        Tue, 18 Jul 2023 02:27:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYFNw7x3jThmvZICEe6iXFu0qG+zQql7vEpRKMvc0qVPxJUK7o8zW+ji84Z85dUEkIw+qD2g==
X-Received: by 2002:a05:6214:509d:b0:63c:7427:e7e9 with SMTP id kk29-20020a056214509d00b0063c7427e7e9mr12261327qvb.6.1689672435965;
        Tue, 18 Jul 2023 02:27:15 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-226-170.dyn.eolo.it. [146.241.226.170])
        by smtp.gmail.com with ESMTPSA id h10-20020a0cf20a000000b00635fc10afd6sm592785qvk.70.2023.07.18.02.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 02:27:15 -0700 (PDT)
Message-ID: <ee31215ededd386eba19fb62b0de8d0bad78d687.camel@redhat.com>
Subject: Re: [PATCH] net: Explicitly include correct DT includes
From: Paolo Abeni <pabeni@redhat.com>
To: Alex Elder <elder@ieee.org>, Rob Herring <robh@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-wpan@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 wcn36xx@lists.infradead.org
Date: Tue, 18 Jul 2023 11:27:10 +0200
In-Reply-To: <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
References: <20230714174809.4060885-1-robh@kernel.org>
	 <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_102928_815421_36870438 
X-CRM114-Status: GOOD (  14.51  )
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

Hi,

On Sat, 2023-07-15 at 10:11 -0500, Alex Elder wrote:
> On 7/14/23 12:48 PM, Rob Herring wrote:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >=20
> > Signed-off-by: Rob Herring <robh@kernel.org>
>=20
> (I significantly reduced the addressee list to permit the message
> to be sent.)
>=20
> For "drivers/net/ipa/ipa_main.c":
>=20
> Acked-by: Alex Elder <elder@linaro.org>

The patch does not apply cleanly to net-next. Rob, could you please re-
spin it? While at that, have you considered splitting it in a few
smaller patches (e.g. can, dsa, freescale, ibm, marvel, mediatek,
stmmicro,  sun, ti, xilinx, wireless, remaining)?

Thanks!

Paolo


