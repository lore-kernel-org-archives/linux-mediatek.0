Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5C8CDE008
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=; b=VHyevKJ3gPdB1jEJB6Yjm85S+m
	nQxX0za2E6U69QvBOXelfr5tvpyj3eMjB7sC9duwXa3rf+AwWJ6KBLIztiCM78osTaN5N58G+1Y/m
	AjfWR/GLAeBnEhoRD2JoGZgot+fWcxUhYgQi/NtCcjKFDAKH4c1qH2GSEk51wTER7A6Jv0mEmiwkK
	ZhBudnrTNDVxtyKJnIe6NlyW7JtmEOkTFrYTvrhoctb2IN8lpjhxpdnNziGT2uVXsUq98L/HRW3d2
	Q5RbjzWQlzEDEhUerAGQO9upmr+UF188b65/s5GA0M0fwe0kZcRDxEIaw0kq0tATA9eeZmdodvscE
	H0jjYY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2cZ-0000000AwoY-1mKO;
	Fri, 26 Jun 2026 09:13:11 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2cX-0000000Awnn-1RMv
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 09:13:10 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6978f1eeb87so1236031a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 02:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465187; cv=none;
        d=google.com; s=arc-20260327;
        b=nzCq+a849qHbz4+j/NYcb0Ih9n1jSoMr/9sdkU4DlADnBzsTov42cE7paiGpCJvv9K
         114lUHga3R30Wt3MDeCG96oqh9N899SbcxiggC+NnNcnbZs3m8bvOflVr0XzKLzzFUM6
         7pGNMnJfFoAhAMv2kShSGZWv6D74vOuxKtpnb7vhko568XMyeTpdLtivVG9N5sUpPxmg
         s3xgZu4yHcN0JevHEAvM3IVjkGvRgXXuykLWbd8ioqckKc56i8ZxculL+ui1QF0Z4SqJ
         NeRazcBbpLcOw/PvinMrCoKNNHAC+MSEdLMlhtWDNcvbuWIizIASA6O/bCx/G7+WfRk2
         pRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        fh=bueSTGA6wdTji1bIDynl43fNy8s9OKHjCHv5CnK4fwE=;
        b=P3ihyNpb2++th6UF8rysKRevFdkrkrskXaM3MSrTJbWpKEH4TxvZgur65p+yk9/O/H
         9wsrYDDZZ7LTJ34RT4jBuBhhBaruOPK1s2BWfcP97PCH6kg3NDEf/aPcmrdXveU+py8O
         Kc8EH+Qrw6fkqmxv6bS68JNl+IgxLTkgPT5WJKCIbcENrBZDE0Mma7d583Vhitwimu/I
         CHYXq7V91FblOT7t2BuPCBEyZ7W6jI1Jf63W0jGAXr5K/MWkI/SfktLBIAoIQNmsosxQ
         cpC5myb1dnOkQQxTNEy2Yazugi3muwoqtEMDbbdH2wyHYn6T1U69zM/l1+KxfVFfDNK1
         g2TQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465187; x=1783069987; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=owOvVd+Dj9igwUZJsrH7H8Bkvjr4RFaGXZ+xr/z+YDLsrfDd5BzJ8qo6zoCW+oxdR9
         YcZ6zAq3uPvhE+25WuLhwuU0vukaxSKqe6voGbIa2wdgFTXmz//X3P+4DnB4Yt9y06ZQ
         tu6iV7vBTiBrageSgtK33jwIK767jS3KwdglMRyQW+OspBG5goLMO1HKCoEm3Z99Sb4U
         WJbmAXU9Z6CEIiPYpjMGiYWq+szJYZVY9DFOrofh8nE8q/+G4nyUTsQq8/YjJpZxkdzb
         ybOx7TJRGmXIGggMXGXpqbyQc9RAt6+YpBk/8OP1yPC+EXvxx0rSL1iMw5cjgTz7VqtR
         OQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465187; x=1783069987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=EPwv8OLG+Q9ukDYcmrHNngkteCP8KhDUqMJccN2oYXuLp8vZmDK+RfOR8RJHIWz+jL
         TC/IIs/ExuV344AYMzjTC1o/odg09y2dgEpzysVXvBT6FwyGkife5hdPeS15QxduEPUw
         wiaE9ejf8HeKQg0jK2+rwyH5QLyCxVpbP2CEOVSnaG8MiI/Zhfyyfvs59I7L9ushGPrt
         IMQsBg6nYmnQTkG4bxCAU808Th+Uzm0AVEmnkZF+/RQR87sUtZVUWRX46Fg7UM6DPs9T
         vAYSbtNHvWURat+jC7nTLg5umqqJcQOSo+D4ysYcznA0Gic0raA6k3ucomtT0uZwsHyM
         Tiyg==
X-Gm-Message-State: AOJu0YwKJGNYoYoSHX/At1iBv2tEdVhkJ2Pv9joJNFXdsyW3TfMV2Rqu
	dAefEMq0/qz84DcKDtLUBZt1l6BlLRxZOhmnkFqAjEKL2swzIYsyDV/06V26ykiT4aumuk9ZiiJ
	GERUb5tqnE4nYTwMToDFhANPSErRexjI=
X-Gm-Gg: AfdE7cn7OqNGyPhE9Jlw1GVp5Ibf7R45KhtYni5L0Qkj2pD37KT7cjTikmiR2XEkY+Z
	1IWrYC+xuv8OIRQ+48o+SufwX25KdHbKe7TjNdyHAjYsL9/cZuIyyqewDYoQKQskUYTJ6bNegpM
	cSW4L4d7eO2S+NlK3BkcUMmlLskOleVGQDVoOBpH3JMLAeKnfJCZSKM5F0E2iywekUlUyERsn2d
	//GF1tcwrm5M3bncVBvRMo+ntRU591r6dyDM3UF8gLE4mKhxUOvIpR1gtiCH3ZFGgR/c2Y=
X-Received: by 2002:a05:6402:190b:b0:697:c0f6:394c with SMTP id
 4fb4d7f45d1cf-69810a44a6dmr1504110a12.9.1782465186628; Fri, 26 Jun 2026
 02:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud> <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
 <20260625-unearth-suffering-e2c59d39da0f@spud>
In-Reply-To: <20260625-unearth-suffering-e2c59d39da0f@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 26 Jun 2026 11:12:55 +0200
X-Gm-Features: AVVi8CdLNvDTFf3GfQHOzooYBWEAR15rw8FIdBZyi6PI5TChocrGHW_idD11qis
Message-ID: <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_021309_398076_5872C03E 
X-CRM114-Status: GOOD (  12.90  )
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

> Usually when making ABI changes because something was inaccurate (but
> not wrong to the point that it didn't work at all) it's possible to
> support both new and old ABIs at the same time because of new properties
> etc. This is a difficult one because it's using the same properties in
> different ways. A new compatible would definitely be required for a
> genuine fresh start while retaining kernel support for the old mechanism
> in this case.

All things considered, the cleanest solution seems to be adding a new
compatible, mark the old one as deprecated and also try to fix the old
driver code. I'll try to do that before submitting again.
Thank you for your help!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

