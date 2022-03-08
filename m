Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FFCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teLIOdaShhnrTfLgmgOQMW6f360DLmRsOA2zJld8Lo4=; b=fMOu1VvA+ETAsz
	YbAj4JLNbYPU+55N8gKabulxyVixQ/4O85/MzP4LlN8Pem8NFezpaL7ngkLsQE7jqvzLpPtkwNPXo
	E5Q/KP9Uy1J1o2OXck2sBe0wqZW1EU3ewFO381CsCevgap3yiY86K8vbRpxpGBX3h++VZFXST9GI3
	J+1PUovROhcFOnp8L9HwBhPy+RR910pAAemM34poKQrWKlhvuXbfr915plwjPIFcuzcJ3Ki6eQPUQ
	KyATDpNJk0WRY5JzCICkBNcyveS3Volf4kcBbcd7kAwXbDM/kzPyR5OE33ST7AilQaBipqwQlGrbd
	C1LJlmtX2Vs5+lGcE72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRZbF-004Sut-Av; Tue, 08 Mar 2022 13:10:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRZb1-004Sq1-Pm
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 13:09:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1442967wmp.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 05:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jIHKyDto3VNe0jan3Q4InEbXVdDFGcIeT9QW9S/Z1yA=;
 b=jbpt5SwnC5KT4ZXh7IxtNsrgGcj7VVb16w1WO4pHVIMxgFqMDC2JVfEPhSd28qEdum
 FEhf6akwghJ1GAdNEziVNhjKIH5oZhPKAHZWQn6kvsYB/rvdJu07tyfVVUP6n59UEdZk
 a+sTDSQY7s5diyafXaq1avAkL4tv1Cp+14rasUL2eS3xOajI9/1d7j8SnSIO6wy42QFf
 DzGN68fI4s1xdo+a7Oa3NAQYmyxk0T39uRam8sUb6a5aU3aUStstOpNCALE5ceUStn7d
 e9YqUUHzXiq0Fu2QMKF1xi1HYTKkgTe6tmCUVMcZV3yg/ygNVYX8oG0ShH4xujfam9L2
 B5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jIHKyDto3VNe0jan3Q4InEbXVdDFGcIeT9QW9S/Z1yA=;
 b=lb5xYMQveJ/J4dcMsgeyVhW4pWl0FRBDBh+ABc4mRdCUFKImq5/vfaxFCZTp9xpTHK
 WokuZ8JkKU0Kf+aEl0nH4G549CWzQILtGj1MLl0Yl/W6RvpV/n/fXDBK18GGVDJHsPzm
 ps3lV5WYW6qtr5VFmUd4kfsQEK+w2U+bn7c90eDOQCjn+vT8tm0s7Smg4knr+Z83shai
 wrOn9wfFVhoaa5JEQVmnAp4ThQp7l2CF2W19KgujM3h+Id+HDPmXJaXi1C4y2Qn6BIxr
 t+Ejc1GLTafqIAdNp88Epp8nWo5YrinmgIKvGjt84clQGGi/6L0050AF4/1ACr+fkxA6
 PYpg==
X-Gm-Message-State: AOAM532CMuNzXRlL8Alnyh7qJQyCRcaignV22uuJjjhdi6eMXnVecu0z
 9mSgA69DiBUuaPc3U2r4EKhG7A==
X-Google-Smtp-Source: ABdhPJyMETb54ZQiFJs9pNCVwtDVfsBQoRRZgo7hsLXgxVZq02upIxNHSYYzogAJuAPCDIJ/7we1ew==
X-Received: by 2002:a1c:3b8a:0:b0:380:e40a:289 with SMTP id
 i132-20020a1c3b8a000000b00380e40a0289mr3481063wma.17.1646744984144; 
 Tue, 08 Mar 2022 05:09:44 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 z6-20020adfd0c6000000b001f1ffd04672sm4048217wrh.12.2022.03.08.05.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:09:43 -0800 (PST)
Date: Tue, 8 Mar 2022 13:09:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [GIT PULL - FAO MARK BROWN]: Immutable branch for MediaTek
 MT6366 due for the v5.18 merge window
Message-ID: <YidVlV8Rg8N5TT8A@google.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <YicTu6FwOR7zIC6I@google.com> <YidQvkIYsacSPsXv@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YidQvkIYsacSPsXv@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_050947_854010_2A050B74 
X-CRM114-Status: GOOD (  15.45  )
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

T24gVHVlLCAwOCBNYXIgMjAyMiwgTWFyayBCcm93biB3cm90ZToKCj4gT24gVHVlLCBNYXIgMDgs
IDIwMjIgYXQgMDg6Mjg6NDNBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gTWFyaywKPiA+
IAo+ID4gVGhpcyBvbmUgaXMganVzdCBmb3IgeW91LCBzbyB5b3UgY2FuIG1lcmdlIHRoZSBvdGhl
ciBwYXRjaGVzLgo+IAo+IEkgZG9uJ3Qga25vdyB3aGF0IHRoZSBvdGhlciBwYXRjaGVzIHlvdSdy
ZSByZWZlcnJpbmcgdG8gaGVyZSBhcmUsCj4gc29tZW9uZSdzIGdvaW5nIHRvIG5lZWQgdG8gcmVz
ZW5kIHRoZW0uCj4gCj4gSSdtIGFsc28gbm90IHN1cmUgdGhpbmdzIGxpa2UgbGlrZSAiRkFPIE1B
UksgQlJPV04iIGluIHRoZSBzdWJqZWN0IGxpbmUKPiBvZiB0aGUgZS1tYWlsLCBJIGNhbiBhbHJl
YWR5IHNlZSBpZiBhIG1lc3NhZ2UgaGFzIGJlZW4gc2VudCB0byBtZSBmcm9tCj4gdGhlIFRvIGFu
ZCBpdCBtZWFucyBsZXNzIG9mIHRoZSBhY3R1YWwgc3ViamVjdCBpcyB3cmFwcGVkIG91dCBvZiBz
aWdodAo+IGluIG15IGluYm94LgoKTWlnaHQgYmUgdGltZSB0byB1cGdyYWRlIHlvdXIgVlQxMDAh
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClByaW5jaXBhbCBUZWNobmljYWwgTGVhZCAtIERl
dmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
