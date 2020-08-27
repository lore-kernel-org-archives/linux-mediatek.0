Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CB5C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 18:23:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22AA82087C
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 18:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pP2RKxTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22AA82087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wPtNcLyxM1DnGkhW9ABXNTPiWecKPtCyRQ2aG0By+k4=; b=pP2RKxTBdG0Ep4xLgwK6T21q9
	wQi9Z0VjH/rf//YZKC+foRwfmj3XDXtkTZsGmFQWFunec5qRfF+y9dZkyDV5aiCEqb0eGngzRmfyN
	JirSMbZw5X16W0ti07tlNflIAoOqS9zSKMFtXBocLjr3q/0/SIZ3aoLxPBdIMLi7GvCxqxZ1YCmQ9
	jjeY2Nc3odWNlzFeOuxnQbPIeWAKsuu/GL89mhftIQ2LaoUjAEUVuo13P+BgW3HwIn5TELJC/KRjs
	46TBBf1p3cxXTgqOFdZUDizjqKEiH+FtuwRh3RKxNE+7AGC0LZSBvrPChGUmMM1UgJMCBlj0mdWQS
	p/XiwSBhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBMYi-0007ef-6j; Thu, 27 Aug 2020 18:23:36 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBMYd-0007cb-Pv; Thu, 27 Aug 2020 18:23:32 +0000
Received: by mail-ej1-f68.google.com with SMTP id d26so9005287ejr.1;
 Thu, 27 Aug 2020 11:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pdlX9vgnoTMRIYbYspp2S5lK6lZM8ygrRr/wz3+jr+4=;
 b=pMV8k/fdDLo30QFYvEG1t/FGPczX2glc0CJI58Shvj97RDTrlJCCyq9JivrcE6ahXX
 /vcxLX6nR4fn9pKaqyZotCN7PgRIYNX4/tC4FSsWcHkchMtzoVRZUNVxLjZ4jxM83oPP
 flIZSV87krdzwd4ITv+eOupOTW7b4nPpS4ZN5fvBmSPIrGRGb1j5YR6KvjM4GHfWnGnZ
 NwppMTB6ibmhDkLbWlo33vt+aMHjWB1piGKwgbTrr634Z4Ajl58cs9Dn6dWDFqTgl7bd
 JzbWxSF4WxMeveOOJTQSEIQH1e7RhtIKZhNjBJTR3iB0bcniKKs9CE0obUBW4RGVaqzR
 D6VQ==
X-Gm-Message-State: AOAM53051s6g/ZyrPwUXU3sR6/vgLF1x9AHDFSBjCYqbOi/oVhep761R
 9pUnoGj+KGdZvCHtZ1lk6+U=
X-Google-Smtp-Source: ABdhPJyspVjh2FWHIe03309ISCWMbh8yVAd38TILVCAjjAV3Ekp/bNQElyveW1elCA5OmAA0HqZZ9A==
X-Received: by 2002:a17:906:eb4f:: with SMTP id
 mc15mr21740650ejb.435.1598552608533; 
 Thu, 27 Aug 2020 11:23:28 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id 94sm2121705edl.47.2020.08.27.11.23.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Aug 2020 11:23:27 -0700 (PDT)
Date: Thu, 27 Aug 2020 20:23:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v2] maiblox: mediatek: Fix handling of platform_get_irq()
 error
Message-ID: <20200827182325.GA4548@kozik-lap>
References: <20200827073128.28389-1-krzk@kernel.org>
 <trinity-b7618ae5-0917-4595-81bb-51764215b02e-1598536674992@3c-app-gmx-bap26>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-b7618ae5-0917-4595-81bb-51764215b02e-1598536674992@3c-app-gmx-bap26>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_142331_892117_A0962C08 
X-CRM114-Status: GOOD (  10.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 03:57:55PM +0200, Frank Wunderlich wrote:
> > Gesendet: Donnerstag, 27. August 2020 um 09:31 Uhr
> > Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> > Betreff: [PATCH v2] maiblox: mediatek: Fix handling of platform_get_irq() error
> 
> typo in subject i guess it should be "mailbox"

Indeed, thanks.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
