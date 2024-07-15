Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322D3C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsJtdePkienB11b2Gh7dlE22owXRs5pqbIPeZpvqS8Y=; b=H/lZmxOdndNKyJK+iPLPDUgCoq
	Z+t0CxUmxihZ+hFJkAMuzvh0D6VOL2IEMhijrLOdmMOrxXRGb+nkMjIGmxCvb4JhLh+7Sp9mw7caW
	dJY3Qws/ES+ztcttQtBbkgAPgBHjzYU5c+tgmq6tJhaH2Zwf40bHSJXUbA/cUeZqbDkcoVCC8teMu
	sbM/WdTVF0H54qS+bJfnMcPV7HUs+gU3RjDsCrRnzCaGeeOPPVY2RVn2RRnxHrOou4tVf4w0ficCn
	g12vuADqb2gD3afEiRsQ+RFGrrVl3sdie2Hy8hvV4VEz5uYdFKNWSmof+xvbf19uHL8XXTheQ47d4
	BwqL33qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTI5v-00000006XjP-3OKh;
	Mon, 15 Jul 2024 09:34:07 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTI5t-00000006Xid-2qsl
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jul 2024 09:34:06 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-59559ea9cfdso5068617a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jul 2024 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721036044; x=1721640844; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jsJtdePkienB11b2Gh7dlE22owXRs5pqbIPeZpvqS8Y=;
        b=SEBRwWPU6tfmjSTMTGPRwxnb4b68h9XVQd7q4Kr5FeHFqKHlCsYY/6PH4rmqOZ13yN
         t/YsfY31jjVfddCMKT21Sjv2qUJAH9iQQKxKWl3pA1FBm5q/e0iOVmaR320e8yoVzcBh
         4Ls2zwfRfEdzBEERnyMKGUdBKki56hPlEmK1aXvnRRvTwRgXxw9VBFntCuxU5cGbvmzg
         qTpfA39S56XPGIZ4bWKNQOuxNxntam2cxo4TeAsMkCvzTx60pV6ki6Kq8g3waHLnWMf0
         cHx8KdIHP9mDsWt0343mvuX+Lx2ybxzGqfhg1zbYeZ4jxBVyXeDPJlcA9bbAhqKImD4m
         XiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721036044; x=1721640844;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsJtdePkienB11b2Gh7dlE22owXRs5pqbIPeZpvqS8Y=;
        b=jget2H00T2KDXX68ozQpsU4lzJ9z450F3f+acnuiR+ACXjibigBqzUbp7SuwO1GMtE
         2bcIf/K5Ay7BgKB3imeQWkCRIQoKWGyKmaCNqd930p4ko+L75UzPxxgrL1LTBZWzaA0D
         lBkVcGZ/ec8RcVwE/M4mu1QHaMrO7bZ0nHvPDzbw7dTSmLXTsnOzcDZRaUbbBx72H0DM
         cxD5+OLahnxDYQwxoYUYAMWZCvzraXnGlkLIGHfYlSiffkeXhgHQEsGn1EaSHxNJnV1p
         8ymImO+CUe0t6BVPN7DIGplFd2KQxvyrL6HpIJZYnhllMapWF9KKmpXkz1HrX1PeyXS5
         tjsA==
X-Forwarded-Encrypted: i=1; AJvYcCU8pOKYwiTdhRZdXbJlS2vm5n10BvHeDP8arc5HyxpKYzqaGYWtlxuQarYpxDvMsBj6K3pcXCabHFy57UceJ5HainojFIRQxzetQHa3kJLof3+E
X-Gm-Message-State: AOJu0Yx+atXJYmo9tArpog4+YKAdgoW1Zlqq/URE+kd3HEeru3OB7hFy
	3yPG5/CopbuHwJs30sMcXiLDA3UDczHT96jYOOs4mKOLUsn6p64Zhmy6Z9LA8e4=
X-Google-Smtp-Source: AGHT+IF1iBD5PBdiW1MXVxPLPw1ldsebD8ec0RQWnh38kfGvPUgFftx9YwQtPep3wbySXU4twET9ag==
X-Received: by 2002:a05:6402:1d56:b0:595:71c7:39dd with SMTP id 4fb4d7f45d1cf-59571c73a66mr14805326a12.34.1721036043742;
        Mon, 15 Jul 2024 02:34:03 -0700 (PDT)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a291asm3129099a12.76.2024.07.15.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 02:34:03 -0700 (PDT)
Message-ID: <37c27c61ebf9e1db06a0d93adcc588fcaccec8ab.camel@gmail.com>
Subject: Re: [PATCH v2] ufs: core: fix deadlock when rtc update
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, beanhuo@micron.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com,  eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 chu.stanley@gmail.com,  stable@vger.kernel.org
Date: Mon, 15 Jul 2024 11:34:01 +0200
In-Reply-To: <20240715063831.29792-1-peter.wang@mediatek.com>
References: <20240715063831.29792-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_023405_738869_42D40CEA 
X-CRM114-Status: GOOD (  10.34  )
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

T24gTW9uLCAyMDI0LTA3LTE1IGF0IDE0OjM4ICswODAwLCBwZXRlci53YW5nQG1lZGlhdGVrLmNv
bSB3cm90ZToKPiBAQCAtODE3MSw3ICs4MTcxLDEwIEBAIHN0YXRpYyB2b2lkIHVmc2hjZF91cGRh
dGVfcnRjKHN0cnVjdCB1ZnNfaGJhCj4gKmhiYSkKPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDC
oMKgwqDCoMKgwqDCoHZhbCA9IHRzNjQudHZfc2VjIC0gaGJhLT5kZXZfaW5mby5ydGNfdGltZV9i
YXNlbGluZTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHVmc2hjZF9ycG1fZ2V0X3N5bmMoaGJhKTsK
PiArwqDCoMKgwqDCoMKgwqAvKiBTa2lwIHVwZGF0ZSBSVEMgaWYgUlBNIHN0YXRlIGlzIG5vdCBS
UE1fQUNUSVZFICovCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHVmc2hjZF9ycG1fZ2V0X2lmX2FjdGl2
ZShoYmEpIDw9IDApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiAr
Cj4gwqDCoMKgwqDCoMKgwqDCoGVyciA9IHVmc2hjZF9xdWVyeV9hdHRyKGhiYSwgVVBJVV9RVUVS
WV9PUENPREVfV1JJVEVfQVRUUiwKPiBRVUVSWV9BVFRSX0lETl9TRUNPTkRTX1BBU1NFRCwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgMCwgMCwgJnZhbCk7Cj4gwqDCoMKgwqDCoMKgwqDCoHVmc2hjZF9ycG1fcHV0X3N5bmMo
aGJhKTsKCk15IHN1Z2dlc3Rpb24gd291bGQgYmUgdG8gbm90IHJldHVybiBoZXJlIGFuZCBqdXN0
IHNraXAgdGhlIHVwZGF0ZSwgYnV0CnJlc2NoZWR1bGUgaXQgZm9yIHRoZSBuZXh0IHRpbWUgdGhh
dCBkb2Vzbid0IGFmZmVjdCB0aGUgc3VzcGVuZC9yZXN1bWUKZmxvdyB5b3UncmUgd29ycmllZCBh
Ym91dC4K


