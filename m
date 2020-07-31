Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F1BC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 16:52:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035722245C
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 16:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fae0M6SY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 035722245C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j+M9Gz6/69qk+WSL/U6JZhZIpKpjyeccYsKdCcVTS6I=; b=fae0M6SYDR0AJlm4wzoORZI4q
	U7xKFNlysLajv7aP+A8xzznqZBCDEs6Cq3/zhpZA3ofbiZkQBA9bmGu5MYbcD8NLL0Oj8BxLKX37t
	Z+cDLzX2bwp0ujQUFXajSdDeT3y9K6tAVvL7Sg5iwGYRQ7AQAT5N2o6ZtzLdT4EAXyzWYq5NtUuZ0
	kqr3z0I7W2GsiPfkS2xibrXFSeaQy+YfZbVI9FEU4lt6WFNEKBX0UK/0EoL0unS8TRp+QUTfljmPr
	XOC2Xay7+zbaFI/qS7FLjmXbqR01fGqVprIY5yTeUb95q/upmU/1B5y7SbhapOEze/CboHz0GVJnz
	zkDofUYRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1YGM-0003lJ-7Q; Fri, 31 Jul 2020 16:52:06 +0000
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1YGH-0003jV-7o; Fri, 31 Jul 2020 16:52:02 +0000
Received: by mail-pf1-f196.google.com with SMTP id s26so14760273pfm.4;
 Fri, 31 Jul 2020 09:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oLGYhoUWlZqZmJCTlVuU9mouFujuKTKpwuXuSMKojnI=;
 b=qraApUqMfbaXo29ppxjSPSwOJvgMAt5QcU268GQgmvbfKL9CNxg4gbVLblzOKI9+zw
 ouSD5L2HdlW4EQSolfCveV0ZGzqDeMdU0NevCLOjQsCvwh3dIX9UFv7NGJmqlDJNYKvU
 VF//K3YOGuQPdY+YLUzGE5VL7AwGDx/nvmzGHpWjBML+KO3tb9/r8WoqS/FTaA73QIYH
 uhxR3nld3Aam+/1jRehz+ba3UZ7mT7m8tVtMGHaZHgr+qDmFJg1kouJD0a+IuB6uzDnX
 uXuk8O1KL4VUB66Dfa3dQdWdELwBV1cZFpEfNN7F85LN1g8JZcQyhr/+Pb3TNLJ4swsz
 +XAg==
X-Gm-Message-State: AOAM533Ppx8rFme7dL7JGb3KG5RGTEmMdnXZl4MA84/tcBtOfn0+vqjo
 6vYw0GsHWApWhSFh6H8bTAs=
X-Google-Smtp-Source: ABdhPJw/GlPhqI9UPgRqOyeeiqcSnBJM5M+mvxD3mXOcyoZbqwUDiLDZrVecwx0Ue40ds8Pdm8f1LQ==
X-Received: by 2002:a63:5b5d:: with SMTP id l29mr4578617pgm.206.1596214319572; 
 Fri, 31 Jul 2020 09:51:59 -0700 (PDT)
Received: from [192.168.50.147] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id w82sm10344378pff.7.2020.07.31.09.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 09:51:57 -0700 (PDT)
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
To: Can Guo <cang@codeaurora.org>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1596159018.17247.53.camel@mtkswgap22>
 <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
 <8b0a158a7c3ee2165e09290996521ffc@codeaurora.org>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <f45c6c47-ffc5-3f8e-3234-9e5989dbf996@acm.org>
Date: Fri, 31 Jul 2020 09:51:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b0a158a7c3ee2165e09290996521ffc@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_125201_347054_1944301E 
X-CRM114-Status: GOOD (  18.73  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, Avri Altman <Avri.Altman@wdc.com>,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wNy0zMSAwMTowMCwgQ2FuIEd1byB3cm90ZToKPiBBRkFJSywgc3ljaHJvbml6YXRp
b24gb2Ygc2NzaV9kb25lIGlzIG5vdCBhIHByb2JsZW0gaGVyZSwgYmVjYXVzZSBzY3NpCj4gbGF5
ZXIKPiB1c2UgdGhlIGF0b21pYyBzdGF0ZSwgbmFtZWx5IFNDTURfU1RBVEVfQ09NUExFVEUsIG9m
IGEgc2NzaSBjbWQgdG8gcHJldmVudAo+IHRoZSBjb25jdXJyZW5jeSBvZiBhYm9ydCBhbmQgcmVh
bCBjb21wbGV0aW9uIG9mIGl0Lgo+IAo+IENoZWNrIGZ1bmMgc2NzaV90aW1lc19vdXQoKSwgaG9w
ZSBpdCBoZWxwcy4KPiAKPiBlbnVtIGJsa19laF90aW1lcl9yZXR1cm4gc2NzaV90aW1lc19vdXQo
c3RydWN0IHJlcXVlc3QgKnJlcSkKPiB7Cj4gLi4uCj4gwqDCoMKgwqDCoMKgwqAgaWYgKHJ0biA9
PSBCTEtfRUhfRE9ORSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogU2V0IHRoZSBjb21tYW5kIHRvIGNvbXBs
ZXRlIGZpcnN0IGluIG9yZGVyIHRvIHByZXZlbnQKPiBhIHJlYWwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIGNvbXBsZXRpb24gZnJvbSByZWxlYXNpbmcgdGhlIGNvbW1hbmQg
d2hpbGUgZXJyb3IKPiBoYW5kbGluZwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICogaXMgdXNpbmcgaXQuIElmIHRoZSBjb21tYW5kIHdhcyBhbHJlYWR5IGNvbXBsZXRlZCwKPiB0
aGVuIHRoZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbG93ZXIgbGV2ZWwg
ZHJpdmVyIGJlYXQgdGhlIHRpbWVvdXQgaGFuZGxlciwgYW5kIGl0Cj4gaXMgc2FmZQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdG8gcmV0dXJuIHdpdGhvdXQgZXNjYWxhdGlu
ZyBlcnJvciByZWNvdmVyeS4KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBJZiB0aW1lb3V0IGhhbmRsaW5nIGxv
c3QgdGhlIHJhY2UgdG8gYSByZWFsCj4gY29tcGxldGlvbiwgdGhlCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBibG9jayBsYXllciBtYXkgaWdub3JlIHRoYXQgZHVlIHRvIGEg
ZmFrZSB0aW1lb3V0Cj4gaW5qZWN0aW9uLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogc28gcmV0dXJuIFJFU0VUX1RJTUVSIHRvIGFsbG93IGVycm9yIGhhbmRsaW5nIGFub3Ro
ZXIKPiBzaG90Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBhdCB0aGlzIGNv
bW1hbmQuCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHRlc3RfYW5kX3NldF9iaXQoU0NNRF9TVEFURV9DT01Q
TEVURSwgJnNjbWQtPnN0YXRlKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBCTEtfRUhfUkVTRVRfVElNRVI7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChzY3NpX2Fib3J0X2NvbW1hbmQoc2NtZCkgIT0gU1VDQ0VTUykg
ewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2hv
c3RfYnl0ZShzY21kLCBESURfVElNRV9PVVQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NzaV9laF9zY21kX2FkZChzY21kKTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgIH0KPiB9CgpJIGFtIGZhbWls
aWFyIHdpdGggdGhpcyBtZWNoYW5pc20uIE15IGNvbmNlcm4gaXMgdGhhdCBib3RoIHRoZSByZWd1
bGFyCmNvbXBsZXRpb24gcGF0aCBhbmQgdGhlIGFib3J0IGhhbmRsZXIgbXVzdCBjYWxsIHNjc2lf
ZG1hX3VubWFwKCkgYmVmb3JlCmNhbGxpbmcgY21kLT5zY3NpX2RvbmUoY21kKS4gSSBkb24ndCBz
ZWUgaG93CnRlc3RfYW5kX3NldF9iaXQoU0NNRF9TVEFURV9DT01QTEVURSwgJnNjbWQtPnN0YXRl
KSBjb3VsZCBwcmV2ZW50IHRoYXQKdGhlIHJlZ3VsYXIgY29tcGxldGlvbiBwYXRoIGFuZCB0aGUg
YWJvcnQgaGFuZGxlciBjYWxsIHNjc2lfZG1hX3VubWFwKCkKY29uY3VycmVudGx5IHNpbmNlIGJv
dGggY2FsbHMgaGFwcGVuIGJlZm9yZSB0aGUgU0NNRF9TVEFURV9DT01QTEVURSBiaXQKaXMgc2V0
PwoKVGhhbmtzLAoKQmFydC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
