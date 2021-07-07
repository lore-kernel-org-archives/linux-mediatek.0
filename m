Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D61C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 20:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C63C961CD1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 20:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C63C961CD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/SY2Da0ri1TLc0jJqO8YJnjfi8uTCU4W6YY+iQN79I=; b=v5CsbV0sLCiQn7o156HzKDO0ks
	VzfXXmso8R97hETyffihWO//WFVGlioyltbH4h8Dl3VHDLnrrC6IUafhm2BGFYm42Jdg4LM/wFCvt
	fwKb2VaTpM6T5q/R96YkE6oHFmBN6tR9W10J7a2WX+QRsZdb0uPXDG8hOnE9mXj6gb3JFFVgkcOp6
	IufTtZuDPP1gx6qngxYwDiOuLLmttu7dGjnzXzKPE60iAR32e9o5y02c1UaOIZyaT3KRKJciPVsRv
	cAXV+u8SvjuNlF1W5SpAPUgydcy0NjKEgaoOv/TwDZvkEDzYpqzJXE0NR+HjsOyFV3qp4lxU2jHCU
	x5xZfuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1EYK-00Fj51-5l; Wed, 07 Jul 2021 20:53:52 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1EYG-00Fj30-TY
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 20:53:50 +0000
Received: by mail-lf1-x135.google.com with SMTP id q18so7737948lfc.7
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Jul 2021 13:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6Wp8xx1y13zDv9+ptI8UgWi/fuXwVxT7bTMwaSgknCI=;
 b=HRqY3NwXYMp/7k9uzipTPVp40AirgtiJsS7sB0HoH/1/E7P5wpz9jDBjTuUz+PdmDy
 bdI3sncjwzbTdcNURukKOsBeAUopnXHkmRXW/N4FrUoUnbIrWUzyy8oR01SpiQg3nSUv
 JWUYMB2Ya7NQPXRhq5bTXnQ7QTcsEnkTGzt9PBY1fW5nbRGf4P+dXsOZ1I1D9pdtgAmQ
 uyXP9q3mjsLmeflori4dUMw1RXs7LMrwUHhO6if4Vcfp8woQw2QcEl/8rrZ6bkaHFtcf
 WUHYINYALnV2SIq8mAMxBJ1/Oy8CoG0KqouVPmFNARBTXQlX/mPGhc/QT51XZePZ5eQn
 9HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Wp8xx1y13zDv9+ptI8UgWi/fuXwVxT7bTMwaSgknCI=;
 b=tJn8QJX00yL8FXEUKA1DOzeJ+Q1+RNhi6JfSpUnIgvbD/W80l3bxLoXr0PtY9ahcu8
 49W8e4ho9d9DdqWy4lr3VlUXt/DUt1KIJRSzzitX61nBgPHyn0FZuD5Fj1mVwRZqCAHQ
 p2C+9H8EAK80mfcPibcGR3l0d9pwyAF/9iCfLthdNSGTMMJNkSkSjneLk/VzrYKvL8D8
 U1ab7/3Ovwdsmmtxs82eRvR4SPk+lICq5BoXP3VJUQ3mE8UoO2UzXLvnGqEQ1IN60Ho+
 kCOYLv1kIRtI1G7mQVu1CJbHNhI7/P2gT9titlflqijeEPmRS8tSq4z2dVvDgnf7cU2T
 y7Cw==
X-Gm-Message-State: AOAM533KIXrd/ZaeoBMhohLlwT08w4/jbZP0cw/R12T/g+AteuTxmXL+
 tlBz9A3vYDQtyMMDmSZfTLqeznno244=
X-Google-Smtp-Source: ABdhPJzOr/pWWdU6/w7teufg+IjiSjFoLhovNeC7TKbtUreCBIdM4eIomM4VSn0j04ZE7uZ3K2s+Sw==
X-Received: by 2002:a19:e05c:: with SMTP id g28mr20784386lfj.299.1625691227031; 
 Wed, 07 Jul 2021 13:53:47 -0700 (PDT)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id s17sm11044ljg.28.2021.07.07.13.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 13:53:46 -0700 (PDT)
Subject: Re: Unstable WiFi with mt76 on MT7628AN
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <7c96d5ee-86c1-8068-1b58-40db6087a24f@gmail.com>
 <88dfb184-7f14-d31a-5e07-668f90c909d8@gmail.com>
Message-ID: <14d485fc-eed4-a65c-747b-a83478da5d8f@gmail.com>
Date: Wed, 7 Jul 2021 22:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <88dfb184-7f14-d31a-5e07-668f90c909d8@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_135349_017911_EF1DE690 
X-CRM114-Status: GOOD (  14.96  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDQuMDcuMjAyMSAwMDoxOSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEl0IG1heSBiZSB3
b3J0aCBtZW50aW9uaW5nIEkgZm91bmQgMSBXQVJOSU5HIGluIG15IGRtZXNnLiBJIGNhbid0IHRl
bGwKPiBpZiB0aGF0IGhhcyBoYXBwZW5lZCBkdXJpbmcgYW55IHNsb3cgZG93biAvIHN0YWxsIG9y
IG5vdC4gVW5mb3J1bmF0ZWx5IEkKPiBkb24ndCBoYXZlIHN5bWJvbHMgaW4gbXkgYmFja3RyYWNl
Lgo+IAo+IFsgMzI0NS4xNzA2ODRdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0t
LQo+IFsgMzI0NS4xNzU0MzRdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDYyNyBhdCB0YXJnZXQtbWlw
c2VsXzI0a2NfbXVzbC9saW51eC1yYW1pcHNfbXQ3Nng4L210NzYtMjAyMS0wNS0xNS05ZDczNjU0
NS9tdDc2MDMvbWFjLmM6MjA2IDB4ODM1ZTQ0YWMgW210NzYwM2VAYmI4YzllNGMrMHg5NTIwXQoK
SSd2ZSBpbnN0YWxsZWQgT3BlbldydCBzbmFwc2hvdCB3aXRoIGRlYnVnIHN5bWJvbHMgaW5jbHVk
ZWQuIEkKcmVwcm9kdWNlZCB0aGUgV0FSTklORy4gSXQgZG9lc24ndCBzZWVtIHRvIGJlIHJlbGF0
ZWQgdG8gc2xvdyBkb3ducyAvCnN0YWxscyAvIG5vIGJlYWNvbnMuCgpbIDMwOTAuMzMzOTI2XSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KWyAzMDkwLjMzODcxNF0gV0FSTklO
RzogQ1BVOiAwIFBJRDogMTE4IGF0IHRhcmdldC1taXBzZWxfMjRrY19tdXNsL2xpbnV4LXJhbWlw
c19tdDc2eDgvbXQ3Ni0yMDIxLTA2LTA2LTIyYjY5MDMzL210NzYwMy9tYWMuYzoyMDYgbXQ3NjAz
X2ZpbHRlcl90eCsweDE2Yy8weDE3NCBbbXQ3NjAzZV0KWyAzMDkwLjM1MzYyM10gTW9kdWxlcyBs
aW5rZWQgaW46IHBwcG9lIHBwcF9hc3luYyBpcHRhYmxlX25hdCB4dF9zdGF0ZSB4dF9uYXQgeHRf
Y29ubnRyYWNrIHh0X1JFRElSRUNUIHh0X01BU1FVRVJBREUgeHRfRkxPV09GRkxPQUQgeHRfQ1Qg
cHBwb3ggcHBwX2dlbmVyaWMgbmZfbmF0IG5mX2Zsb3dfdGFibGVfaHcgbmZfZmxvd190YWJsZSBu
Zl9jb25udHJhY2sgbXQ3NjAzZSBtdDc2IG1hYzgwMjExIGlwdF9SRUpFQ1QgY2ZnODAyMTEgeHRf
dGltZSB4dF90Y3B1ZHAgeHRfbXVsdGlwb3J0IHh0X21hcmsgeHRfbWFjIHh0X2xpbWl0IHh0X2Nv
bW1lbnQgeHRfVENQTVNTIHh0X0xPRyBzbGhjIG5mX3JlamVjdF9pcHY0IG5mX2xvZ19pcHY0IG5m
X2RlZnJhZ19pcHY2IG5mX2RlZnJhZ19pcHY0IGlwdGFibGVfbWFuZ2xlIGlwdGFibGVfZmlsdGVy
IGlwX3RhYmxlcyBjcmNfY2NpdHQgY29tcGF0IG5mX2xvZ19pcHY2IG5mX2xvZ19jb21tb24gaXA2
dGFibGVfbWFuZ2xlIAppcDZ0YWJsZV9maWx0ZXIgaXA2X3RhYmxlcyBpcDZ0X1JFSkVDVCB4X3Rh
YmxlcyBuZl9yZWplY3RfaXB2NiBzaGEyNTZfZ2VuZXJpYyBsaWJzaGEyNTYgc2VxaXYgaml0dGVy
ZW50cm9weV9ybmcgZHJiZyBobWFjIGdoYXNoX2dlbmVyaWMgZ2YxMjhtdWwgZ2NtIGN0ciBjbWFj
IGNjbSBsZWRzX2dwaW8gZ3Bpb19idXR0b25faG90cGx1ZyBhZWFkIGNyeXB0b21nciBjcnlwdG9f
bnVsbCBjcnlwdG9faGFzaApbIDMwOTAuNDE3NjM1XSBDUFU6IDAgUElEOiAxMTggQ29tbToga3dv
cmtlci91MzowIE5vdCB0YWludGVkIDUuNC4xMjggIzAKWyAzMDkwLjQyNDE4Nl0gV29ya3F1ZXVl
OiBuYXBpX3dvcmtxIG5hcGlfd29ya2ZuClsgMzA5MC40Mjg2MTZdIFN0YWNrIDogODA1ODlhYmMg
ODM1NzQ0YWMgMDAwMDAwMDkgMDAwMDAwMDAgMDAwMDAwMDAgODAwNWIxMDAgODNkNjRjYzAgMDAw
MDAwMDAKWyAzMDkwLjQzNzEwNl0gICAgICAgICAwMDAwMDAxNyA4M2M5OGRiYyA4MDU3YTZiOCA4
M2RlNWJlYyA4MDYyMDAwMCAwMDAwMDAwMSA4M2RlNWJjMCA2MDFjMWUzNwpbIDMwOTAuNDQ1NTgz
XSAgICAgICAgIDAwMDAwMDAwIDAwMDAwMDAwIDgwNjM5M2MwIDAwMDAwMDAwIDcxNmI3MjZmIDAw
MDAwMGEwIDZmNzc1ZjY5IDZlNjY2YjcyClsgMzA5MC40NTQwNzBdICAgICAgICAgMDAwMDAwMDAg
MDAwMDAwOTkgMDAwMDAwMDAgMDAwNjc4ZmEgMDAwMDAwMDAgMDAwMDAwMDkgMDAwMDAwMDAgODM1
NzQ0YWMKWyAzMDkwLjQ2MjU1N10gICAgICAgICAwMDAwMDAwOSAwMDAwMDAwMCAwMDAwMDAwMCA4
MzU4MDAwMCAwMDAwMDAwMCA4MDJiYmFjOCAwMDAwMDAwMCA4MDc4MDAwMApbIDMwOTAuNDcxMDQ2
XSAgICAgICAgIC4uLgpbIDMwOTAuNDczNTIyXSBDYWxsIFRyYWNlOgpbIDMwOTAuNDc2MDE3XSBb
PDgwMDA5YzkwPl0gc2hvd19zdGFjaysweDMwLzB4MTAwClsgMzA5MC40ODA1NDJdIFs8ODAwMjNi
YTA+XSBfX3dhcm4rMHhjMC8weDEwYwpbIDMwOTAuNDg0NjkzXSBbPDgwMDIzYzQ4Pl0gd2Fybl9z
bG93cGF0aF9mbXQrMHg1Yy8weGFjClsgMzA5MC40ODk3NTRdIFs8ODM1NzQ0YWM+XSBtdDc2MDNf
ZmlsdGVyX3R4KzB4MTZjLzB4MTc0IFttdDc2MDNlXQpbIDMwOTAuNDk1NzY3XSBbPDgzNTc0NjQ0
Pl0gbXQ3NjAzX3d0Ymxfc2V0X3BzKzB4MTJjLzB4MTM0IFttdDc2MDNlXQpbIDMwOTAuNTAxOTcz
XSBbPDgzNTcxYTFjPl0gbXQ3NjAzX3N0YV9wcysweDM4LzB4NDI4IFttdDc2MDNlXQpbIDMwOTAu
NTA3NjY5XSBbPDgzNTU0N2Y0Pl0gbXQ3Nl9yeF9wb2xsX2NvbXBsZXRlKzB4MmUwLzB4NWIwIFtt
dDc2XQpbIDMwOTAuNTEzODYwXSBbPDgzNTUxNTNjPl0gbXQ3Nl9kbWFfcnhfcG9sbCsweDNkOC8w
eGVmYyBbbXQ3Nl0KWyAzMDkwLjUxOTYzNF0gWzw4MDM1YjNkYz5dIF9fbmFwaV9wb2xsKzB4M2Mv
MHgxMGMKWyAzMDkwLjUyNDIyN10gWzw4MDM1YjRlYz5dIG5hcGlfd29ya2ZuKzB4NDAvMHg5MApb
IDMwOTAuNTI4NzUxXSBbPDgwMDNiMGU4Pl0gcHJvY2Vzc19vbmVfd29yaysweDIyMC8weDQ4MApb
IDMwOTAuNTMzODc4XSBbPDgwMDNiNGIwPl0gd29ya2VyX3RocmVhZCsweDE2OC8weDVjOApbIDMw
OTAuNTM4NzU5XSBbPDgwMDQwMWVjPl0ga3RocmVhZCsweDEzOC8weDE0MApbIDMwOTAuNTQzMDg4
XSBbPDgwMDA1MTc4Pl0gcmV0X2Zyb21fa2VybmVsX3RocmVhZCsweDE0LzB4MWMKWyAzMDkwLjU0
ODU3N10gLS0tWyBlbmQgdHJhY2UgMDY4YTc1OWVkMTY1NGI1MiBdLS0tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
