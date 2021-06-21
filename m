Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B854AC4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 11:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E93E60FE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 11:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E93E60FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ov/PmZEIK1kUyjZiVOLrUg6uhsSWIOPdq1MAdKgwy18=; b=Ssy6PaNOTBHKD7v/uQJ0tRwvoW
	HvRTSf/7b8OlHWLBvVdLZ+VOURL3z+Zn0+16SEPgbEQCJdPa4ht9zqBjI0ip+OCTBOcvpVKLevnkH
	QFFBDqd+GUDopAsiHtGvud/+a+HkHat/qlagAlN0IUldD/NfmjmLoXPOOKqCdxGcBFq2cvAMfhkcA
	oW2GDFv8pbLBKU19r9efEJ+29FnMgl0ouutDX4h7smRAAeuh4rrz2XbXZiZRIZacphzeQrNpd53Xu
	R7ZGhioBkqjAY0DlR/9jcgjYgKz2/y1S0ZbJct+7vMx/XiPXnP56i1Nrp/5jAEl+kzYGc2BBCsxul
	lJVs/ftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvI4V-003JGO-KX; Mon, 21 Jun 2021 11:26:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvI4R-003JE7-Ok
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 11:26:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id k42so8364803wms.0
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 04:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VQIndBF+raV4yH/uAef42b9tgSUc/q1HIDoWGC5a4rI=;
 b=RTrAlXf9cKXMVWwPGTX1Kwgjh+eL5clejf7gh7Vjpa/nemnps6a40jTvvUVsfcT6HU
 UOzJzgyK9BDJKzXsF6CcygNTm7Unq1YvMT50PDBrYefsKVO2/anOsOfeDx03Xi5/WxGQ
 GhrK+l+kGMq/eeUNIMEu3tX4itq5fJbgbc9jF7BKYGFoVeBfZMen60pt0XxNCMLHFK4I
 lySoWPGXX3GwLDZuYgFrpa0qzqU0hixPCFJ32zDR3CAhZsY5mKrDXnko3xzXM2IZDgP/
 G/lBWjB5hIEDalX/aYWlHoajEdXb7vm8ziSv3a6/2ewgh/4YJibXy35JIRiBweMngetG
 zAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VQIndBF+raV4yH/uAef42b9tgSUc/q1HIDoWGC5a4rI=;
 b=BQyvTKRi0JG0RyjcqOi+I2fRS8+UpaWbiP6+hahZ9bO5FqE4FIfsqVYACC3OVpSI0w
 qZhPUoL7OUV6mZ9wHt6NF/SZWcBkLMoDLKGQ8mjdxt6nEEQkivCIxmbeS4j0ATaeLctd
 8Wm3y/iDsofpwNJ2870QfRevKfoKrUdBNZWdHXjs9lTW4pJQmiOFLxbVN5kGIY8FDCnN
 hS1IXU+fRQQqdungsaXWENiFkFyXnCBc4vucQJ7F3m8QHNNYYx+TBH3fv2+yp85vh9/y
 BQMvZpssTWWliYK7k1TUO+2z02Jedlg5I+2XQfPPVMhuZ83dkeod0KY/lZwBAY1PHxSg
 hz7A==
X-Gm-Message-State: AOAM5307HN+kF+joY3XEVcKsS/4mBXokS1i682zJB+lz2x3cMxIURxYI
 M8ytqsXdbqrE86RYg9qi/xchgA==
X-Google-Smtp-Source: ABdhPJzBf/rLzdPhlwdeWkxppRCDDwZPEvglk1oWay5c9Zwsnkp4D3mNVDvM1mQNffoDwpamZ2GZ+Q==
X-Received: by 2002:a05:600c:88a:: with SMTP id
 l10mr26901650wmp.7.1624274785928; 
 Mon, 21 Jun 2021 04:26:25 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5ebd:8bd9:d549:4211?
 ([2a01:e34:ed2f:f020:5ebd:8bd9:d549:4211])
 by smtp.googlemail.com with ESMTPSA id s5sm18556352wrn.38.2021.06.21.04.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 04:26:25 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 2/3] thermal: mediatek: Add LVTS drivers for SoC
 theraml zones
To: Ben Tseng <ben.tseng@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
 srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>,
 Yu-Chia Chang <ethan.chang@mediatek.com>
References: <20210617114707.10618-1-ben.tseng@mediatek.com>
 <20210617114707.10618-3-ben.tseng@mediatek.com>
Message-ID: <06b1804c-4675-2997-8c5c-bcdffbcfc4a1@linaro.org>
Date: Mon, 21 Jun 2021 13:26:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617114707.10618-3-ben.tseng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_042627_889404_93F24C9B 
X-CRM114-Status: GOOD (  10.81  )
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

T24gMTcvMDYvMjAyMSAxMzo0NywgQmVuIFRzZW5nIHdyb3RlOgo+IEZyb206IE1pY2hhZWwgS2Fv
IDxtaWNoYWVsLmthb0BtZWRpYXRlay5jb20+Cj4gCj4gQWRkIGEgTFZUUyAoTG93IHZvbHRhZ2Ug
dGhlcm1hbCBzZW5zb3IpIGRyaXZlciB0byByZXBvcnQganVuY3Rpb24KPiB0ZW1wZXJhdHVyZXMg
aW4gTWVkaWF0ZWsgU29DIGFuZCByZWdpc3RlciB0aGUgbWF4aW11bSB0ZW1wZXJhdHVyZQo+IG9m
IHNlbnNvcnMgYW5kIGVhY2ggc2Vuc29yIGFzIGEgdGhlcm1hbCB6b25lLgoKSSB0aGluayB3ZSBh
bHJlYWR5IHRhbGtlZCBhYm91dCB0aGF0LiBXZSBkb24ndCB3YW50IGEgdGhlcm1hbCBzZW5zb3IK
ZHJpdmVyIHRvIGFnZ3JlZ2F0ZSB0aGUgdGVtcGVyYXR1cmVzIGJ1dCBjcmVhdGUgc29tZSBraW5k
b2YgdmlydHVhbApzZW5zb3Igd2l0aCBhIHByb3BlcnR5IChtaW4sIG1heCwgYXZnLCAuLi4pIHdo
aWNoIGlzIHVzYWJsZSBieSBhbnlvbmUuCgpbIC4uLiBdCgoKCi0tIAo8aHR0cDovL3d3dy5saW5h
cm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0Nz
CgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4g
RmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8Cjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
