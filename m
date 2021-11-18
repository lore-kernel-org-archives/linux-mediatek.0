Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 22:44:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3150E611CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 22:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3150E611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqF8jdvVGprIU2oG/4+7c3cJvSoI0fxqMV5jVUMs3I8=; b=CagAbkbaWTc3Xw
	azMKbT3i5QStEHerPbn7MY70dRzRrKSkNAArnSZEkNv7iVOo1YIoA3FdY9OD6nYvx6H4Li4RtNk8/
	fSQbgC4o/B527IlxoKEuiAPWNnNINAdDEB9Mjl90UXBifXETqQ8ZAS83wutfV13UKU/GSUrgyC1aQ
	bnV92wkqXhbPQH4J+cb8qHD+Dj8bqCXWIPup1EqdKLZne/nysOlMbNTuLDz0lLWDHOiUMvnwlvJAl
	wr1Z8MKWo7GeoqB1ABlyxmyykS103UWimG8Er/NQ+5d3hNMu691HC95DyuSYrgfSrGspCiTNEeGmq
	JARc6PvLgwgGlNDdipjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnq8X-008zeU-7G; Thu, 18 Nov 2021 22:44:09 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnq8J-008zcP-Hz; Thu, 18 Nov 2021 22:43:56 +0000
Received: by mail-oo1-f44.google.com with SMTP id
 r18-20020a4a7252000000b002c5f52d1834so3034873ooe.0; 
 Thu, 18 Nov 2021 14:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PxnCVezNopKR+k8ykkz9LIWuyHdpRUeIr4oh8AQBA8c=;
 b=cYauaEUQ3FX/xwbmxBBcwmiwLH7sYB+pwbcqF4Iwf4GuqM5qKdWszZs1U7WjdhnV1X
 8wBIPqMXZds9QPw38gakurvHJ7T9Gz7o7TT1WCrAyltjvLxb/9AfBXGOPFzdUoZ7ke7p
 HtoRUF35kl7xkDfU8MsBPpk1ln82VAoLlaz9mPBIXgL3gaUXuq6rPCxaHjHrmsDfsViI
 lfyOL1qE8dN6D2DBIBugJ0Q0gAjTVYzzjWZtCzuDhgEizLnx3IlBIOJbEZGqjehlLKHr
 XUaIV+3fVonNyi1tHAinxxgM3QSeBwqsHzQyLoIupOox5wvSEubew1rj7MdTvjCXPDY9
 0QPQ==
X-Gm-Message-State: AOAM5335ULXw3AxXygdUcVGEv+mU+aV0nj1XdWfaxU57Fw2XSHNaFZvI
 szk+BjTwP8s0B3LsK/WiSHGksnU4fw==
X-Google-Smtp-Source: ABdhPJwZEiszKbwpz6hrqsSazqPPFsRt5w9KZlN+9P1OkdeFkB3Fa/RXJCmk5rFKGcrFWAaqmNBKsA==
X-Received: by 2002:a4a:9292:: with SMTP id i18mr15333917ooh.90.1637275433084; 
 Thu, 18 Nov 2021 14:43:53 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r26sm222958otn.15.2021.11.18.14.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 14:43:52 -0800 (PST)
Received: (nullmailer pid 1897260 invoked by uid 1000);
 Thu, 18 Nov 2021 22:43:51 -0000
Date: Thu, 18 Nov 2021 16:43:51 -0600
From: Rob Herring <robh@kernel.org>
To: James Lo <james.lo@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v15 1/4] dt-bindings: spmi: remove the constraint of reg
 property
Message-ID: <YZbXJ3/C+ovlYEF0@robh.at.kernel.org>
References: <20211115042030.30293-1-james.lo@mediatek.com>
 <20211115042030.30293-2-james.lo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115042030.30293-2-james.lo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_144355_632454_BA68E67C 
X-CRM114-Status: GOOD (  11.09  )
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

On Mon, Nov 15, 2021 at 12:20:27PM +0800, James Lo wrote:
> 'reg' is controller specific so we shouldn't even be specifying it here.
> Just remove it.
> 
> Signed-off-by: James Lo <james.lo@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spmi/spmi.yaml | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
