Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F84C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 17:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9259D2073A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 17:30:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q5CQeMMJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="IfI2V2Vj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9259D2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EjwmqUpkbDf3AjngyfFNkMtJ9aQkc2OvRL+hIBgucA=; b=Q5CQeMMJPUtaLH
	G4MXvDk7trcHSJpR7iWuySnCuvEFxa9FbjT7Tgm/BmLPLp16ZJwVftB+vfZrHeNZ8yj5uMiZArKAx
	05gTXmydG6Z+qWor61uUpomPjLl2hOKjiuQgdlijbBpgHA9mp659N0xjPpUDJl/RSYWVVRZnCpeIF
	TYT+sIZlM+S7pNeHcET+6J/RSGPcp41N+t4OmOpfk438SCJNRfqz6OAffnoylmBvyI8sZKD3cRotr
	L/UtQ7wQN/3I3DtZCZAYo79EVPr0I6DSJY5tGe5q5J+0Pz8BrA+mQzvB7N5FtSMSrCadJi2mSIght
	ZXvStz4q3PL6yn7S4Jgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isVSC-0000dd-9q; Fri, 17 Jan 2020 17:30:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isVS6-0000cS-QM
 for linux-mediatek@lists.infradead.org; Fri, 17 Jan 2020 17:30:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id f129so8456907wmf.2
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jan 2020 09:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s/Igl7jec5R8DMF3nyQFihy0XoNH7LpzgEc781wHBbE=;
 b=IfI2V2VjiHDEyMxVeB6DJUwZfuJaVSwdWaVbiW2tG1VzG5iMe4Fmndr3Dh8Y5KaF7g
 SbVP5Ca373H4SpjZNwlaPj0ajlmO5/0RXj4cboBUBjlynN2ihp0sj5+LxlF9hYR3Gs5D
 5Qv2rZh4Yzvc8lS4UP3Ac5LRe5cw1v+Y0yJdR8pwwdPPusdbhjfrDBsi13y8DYwoaakI
 cuAz6BXfPrsKPA1w9FiWbzNzE9zzgpb3Rr4pw20A0bJZFGooUMKUtslJ3QXvxVnMh650
 IIszWgCEmch4wXJw0b3IsDeqswH27TUpZ2/KnyYvteCdFYD5butLob8faQQd6VS5iI6D
 fZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s/Igl7jec5R8DMF3nyQFihy0XoNH7LpzgEc781wHBbE=;
 b=mt++FiRJyBuoKZ3/L+tDST0ip5hrPO/gQATLcZg3u1AFKaEvSLAuWpj7DCijveHcoz
 0choNlGmPY7FQXLDTFHMbf77T4tWeY8l3twUdkcYDLv385lAtt1zkIQMez7hUNury6hi
 uS5EGJxDQIM9dZeQo1gS3Wbvm55P1Xd8o4mfkrqedS04AmY2sa49HM1FxHSDzz9BHQZG
 CE6n02vsfuVEcOkaVMKHcxzav53lLiR13BDOBTqq11l9/2fEMdcaHJpswp12TlWfF5TM
 MPOQk4Wytg5f0CjP8QN9jX86I0H5JOEmxialhuEngjGeTGkejtr91jWHIK516nbm9jOu
 6zxw==
X-Gm-Message-State: APjAAAVpuJ8vw9GKb+NR9ktt/wiuNeKHj0yKjlL2IPj/MBcKkhSf56ek
 0xmrZOBebWEK5mI7ZkD+hivygdAPQPv1oPVMhplNeg==
X-Google-Smtp-Source: APXvYqzRUf0wuugbvneoW29gNcVYmOiCM6ix6iVR1pyh/dPBzXnBInYEBfLi/RQ7RKNXoAYeNH1N+QN4jkAc1zvQ3nI=
X-Received: by 2002:a1c:7e0b:: with SMTP id z11mr5822249wmc.88.1579282226314; 
 Fri, 17 Jan 2020 09:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20200116043612.52782-1-surenb@google.com>
 <20200117151533.12381-1-mkoutny@suse.com>
In-Reply-To: <20200117151533.12381-1-mkoutny@suse.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 17 Jan 2020 09:30:15 -0800
Message-ID: <CAJuCfpHkOz1LmygyxC9VxXux8_TFmEGr-BsAs-EadKt=AkZyiQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] cgroup: Iterate tasks that did not finish do_exit()
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_093034_854919_87F0744F 
X-CRM114-Status: GOOD (  13.16  )
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
Cc: JeiFeng Lee <linger.lee@mediatek.com>, Tom Cherry <tomcherry@google.com>,
 shuah@kernel.org, LKML <linux-kernel@vger.kernel.org>, matthias.bgg@gmail.com,
 Li Zefan <lizefan@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, cgroups mailinglist <cgroups@vger.kernel.org>,
 alex.shi@linux.alibaba.com, kernel-team <kernel-team@android.com>,
 Roman Gushchin <guro@fb.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFsLAoKT24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgNzoxNSBBTSBNaWNoYWwgS291dG7D
vSA8bWtvdXRueUBzdXNlLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPiBJIHdhcyBsb29raW5nIGludG8g
dGhlIGlzc3VlIGFuZCBjYW1lIHVwIHdpdGggYW4gYWx0ZXJuYXRpdmUgc29sdXRpb24gdGhhdAo+
IGNoYW5nZXMgdGFzayBpdGVyYXRpb24gdG8gYmUgY29uc2lzdGVudCB3aXRoIGNncm91cF9pc19w
b3B1bGF0ZWQoKSBjaGVjayBhbmQKPiBtb3ZpbmcgdGhlIHJlc3BvbnNpYmlsaXR5IHRvIGNoZWNr
IFBGX0VYSVRJTkcgb24gdGhlIGNvbnN1bWVycyBvZiBpdGVyYXRvciBBUEkuCgpZZWFoLCB0aGF0
IHdhcyBteSBmaXJzdCB0aG91Z2h0IHdoaWNoIGJhc2ljYWxseSByZXZlcnRzIGEgcGFydCBvZgpj
MDNjZDc3MzhhODMuIFdoZW4gSSBmaXJzdCBicm91Z2h0IHVwIHRoaXMgaXNzdWUgaW4gdGhlIG90
aGVyIGVtYWlsCnRocmVhZCwgVGVqdW4ncyBjb21tZW50IHdhcyAidGhlIHJpZ2h0IHRoaW5nIHRv
IGRvIGlzIGFsbG93aW5nCmRlc3RydWN0aW9uIG9mIGNncm91cHMgdy8gb25seQpkZWFkIHByb2Nl
c3NlcyBpbiBpdCIuIEkgYXNzdW1lZCwgbWF5YmUgaW5jb3JyZWN0bHksIHRoYXQgdGhlIGRlc2ly
ZQpoZXJlIGlzIG5vdCB0byBpbmNsdWRlIGR5aW5nIHByb2Nlc3NlcyBpbnRvIGNncm91cC5wcm9j
cyBidXQgdG8gYWxsb3cKY2dyb3VwcyB3aXRoIGR5aW5nIHByb2Nlc3NlcyB0byBiZSBkZWxldGVk
LgoKVG8gYmUgY2xlYXIsIGVpdGhlciB3YXkgaXMgZmluZSB3aXRoIG1lIHNpbmNlIGJvdGggd2F5
cyBzb2x2ZSB0aGUKaXNzdWUgYW5kIHRoaXMgd2F5IHRoZSBjb2RlIGlzIGRlZmluaXRlbHkgc2lt
cGxlci4gSSdsbCByZXJ1biB0aGUKdGVzdHMgd2l0aCB5b3VyIHBhdGNoZXMganVzdCB0byBjb25m
aXJtIHRoZSBpc3N1ZSBpcyBnb25lLgpUaGFua3MhCgo+IEkgaGF2ZW4ndCBjaGVjayB5b3VyIGFw
cHJvYWNoIHRob3JvdWdobHksIGhvd2V2ZXIsIGl0IGFwcGVhcnMgdG8gbWUgaXQKPiBjb21wbGlj
YXRlcyAoYWxyZWFkeSBub24tdHJpdmlhbCkgY2dyb3VwIGRlc3RydWN0aW9uIHBhdGguIEkgcmFu
IHlvdXIgc2VsZnRlc3QKPiBvbiB0aGUgaXRlcmF0b3JzIGFwcHJvYWNoIGFuZCBpdCBwcm92ZWQg
d29ya2luZy4KPgo+Cj4gTWljaGFsIEtvdXRuw70gKDIpOgo+ICAgY2dyb3VwOiBVbmlmeSBjc3Nf
c2V0IHRhc2sgbGlzdHMKPiAgIGNncm91cDogSXRlcmF0ZSB0YXNrcyB0aGF0IGRpZCBub3QgZmlu
aXNoIGRvX2V4aXQoKQo+Cj4gU3VyZW4gQmFnaGRhc2FyeWFuICgxKToKPiAgIGtzZWxmdGVzdC9j
Z3JvdXA6IGFkZCBjZ3JvdXAgZGVzdHJ1Y3Rpb24gdGVzdAo+Cj4gIGluY2x1ZGUvbGludXgvY2dy
b3VwLWRlZnMuaCAgICAgICAgICAgICAgICB8ICAxNSArKy0KPiAgaW5jbHVkZS9saW51eC9jZ3Jv
dXAuaCAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCj4gIGtlcm5lbC9jZ3JvdXAvY2dyb3Vw
LmMgICAgICAgICAgICAgICAgICAgICB8ICA4NiArKysrKysrKy0tLS0tLS0tCj4gIGtlcm5lbC9j
Z3JvdXAvZGVidWcuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxNiArKy0KPiAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvY2dyb3VwL3Rlc3RfY29yZS5jIHwgMTEzICsrKysrKysrKysrKysrKysr
KysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDE3NiBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi4yNC4xCj4KPiAtLQo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91
cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8ga2Vy
bmVsLXRlYW0rdW5zdWJzY3JpYmVAYW5kcm9pZC5jb20uCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
