Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA36EC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 10:00:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F92061375
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 10:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F92061375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:CC:To:Date:From:Subject:
	MIME-Version:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoJWSZYMpsqygFArohqTnYYQwb9fDqiB5jUYEGog5wg=; b=iO0mL9Rjb305bQ
	lhI5lElwymOQA1wL2gCrcJR2jqjO0jsr4507M+E9TSqZj5NFs1xYLdd6q21CTMYzMdU2MfpZVp21T
	a6h348Ay340UEbRB5DD1q38ytwquACbj1O7fWQ1UPXasZ9iS1jh92h2fBnV0tzNUSHghlGlp0ko7j
	FcjMXSSg1OThJQzgEi+iDgvz7dtefG/q0h137Kr4NNwPkjzv72qtLP/EInlpBLX8npAH5OwTS5krt
	qDDF1ZnoeDAGbZ3en0jUakbOK6ZKChrwgnP5lMa1gznQE/3DVJAMQnLaCajTpJd8sdcJAKGqltHtf
	vvYSyQWgbjD03CE2+3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwM9r-00Dsec-AO; Thu, 24 Jun 2021 10:00:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwM8z-00DsJE-RY; Thu, 24 Jun 2021 09:59:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id w13so1680460edc.0;
 Thu, 24 Jun 2021 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=in-reply-to:references:thread-topic:user-agent:mime-version
 :content-transfer-encoding:subject:from:date:to:cc:message-id;
 bh=owJIkwgTJJrr321dtXmmzgJyCT9kVjIZQoA7WhwaN5E=;
 b=Bp+2sNTW3g7PLme41cAL37qFxYrxSKMOPJuG59AGYho73N1c4S7rgqtgL2bP2eBI4x
 gbWj08J6lCp22LGJFh2ZCOTaDh68MnWmU+05//X+P1iwmwbPM3MQLNr9B8tr3QybaCHn
 tY9tmfkvw1J6sbtg47CqzmPRRBwpIleB8agyesqa2+FWifSIVU4qeZUxLRSS8/F4l5lX
 gWL4vciaaBftqwXgTIFiqUjqfSb5Xf/OIXa5fwadozwvF1E3q04Stm12WUjifrFbBp+0
 hx3V8FD7Kf50pvFzlq1375v/nCBbecIneAME8HbDXzN+yhchRw+wIIrAfYp5qWbZH3wd
 igWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:in-reply-to:references:thread-topic:user-agent
 :mime-version:content-transfer-encoding:subject:from:date:to:cc
 :message-id;
 bh=owJIkwgTJJrr321dtXmmzgJyCT9kVjIZQoA7WhwaN5E=;
 b=m5gkTCFg7CoDFt5teccSlUTAljTSviwX8WrAcxFRA1xP7COhJZUq5fMDwLJjY0d/lt
 V/VZSlOe670xizMIpD9oVd6J//yfYK4nnWDUr9H5NARHJ7OhBj2A5P5S5a1e9/gxWyD1
 BRkUGBAlmwEKz1JCLy+lVkdf9xjTYsAnZp+h8c0dJXJUO8ksOqhMOsg0feHiztnRb9m6
 ZHuiKCdXlaWVSp5ti9bztIonMOMNG9C5/E7EexnrAAtaBIqsFY4RlZaG6DQjSX+rrprK
 9ikLwE4vhyFB/gWjq6XqyGMdOvmtOaQXifN3H40j8kwEJgk4wStmX6EaYcshiq9s0YRa
 FiOQ==
X-Gm-Message-State: AOAM532q2M6nnDgUOR9GAJctA/7EuOBYubeRZecp+Jzr9mT1otuSyhK5
 6fAabTGNy8My05CYNHO4q4U=
X-Google-Smtp-Source: ABdhPJx2dWphuRerA3LvDrqmt1OS8hcogXtPG+lKZI9IKpFkm0eAdkFt4zUb2comrFjGml2G+matMg==
X-Received: by 2002:a05:6402:144e:: with SMTP id
 d14mr5808846edx.339.1624528772180; 
 Thu, 24 Jun 2021 02:59:32 -0700 (PDT)
Received: from [192.168.178.102] (82-72-98-83.cable.dynamic.v4.ziggo.nl.
 [82.72.98.83])
 by smtp.gmail.com with ESMTPSA id h20sm939287ejl.7.2021.06.24.02.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 02:59:31 -0700 (PDT)
In-Reply-To: <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
X-Referenced-Uid: 5594
Thread-Topic: Re: [PATCH] Fix mt7622.dtsi thermal cpu
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
Subject: Re: [PATCH] Fix mt7622.dtsi thermal cpu
From: Eric Woudstra <ericwouds@gmail.com>
Date: Thu, 24 Jun 2021 11:59:30 +0200
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org,linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,linux-kernel@vger.kernel.org
Message-ID: <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_025933_991207_88E97905 
X-CRM114-Status: GOOD (  24.70  )
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

CkZvciBNYXJ2ZWxsOgoKaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS91cmw/c2E9dCZzb3VyY2U9d2Vi
JnJjdD1qJnVybD1odHRwczovL3dpa2kua29ib2wuaW8vaGVsaW9zNC9maWxlcy9zb20vYnJvY2h1
cmVfYTM4eF9taWNyb3NvbV8yMDE3LTA5LTA1LnBkZgoKQXJtYWRhMzh4IG1heGltdW0gZGllIHRl
bXBlcmF0dXJlIDExNSBkZWdyZWVzIENlbGNpdXMuIFRoZXkgcmVhbGx5IGdldCBob3R0ZXIgdGhl
biAxMDAuCgpCdXQgZm9yIG10NzYyMiBJIGNhbm5vdCBmaW5kIHRoaXMgdmFsdWUKCuKBo0dldCBC
bHVlTWFpbCBmb3IgQW5kcm9pZCDigIsKCk9uIEp1biAyMywgMjAyMSwgMTA6MDggUE0sIGF0IDEw
OjA4IFBNLCBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gd3JvdGU6
Cj5PbiAyMy8wNi8yMDIxIDIwOjQzLCBFcmljIFdvdWRzdHJhIHdyb3RlOgo+PiAKPj4gSSBjaG9v
c2UgImhvdCIgYmVmb3JlLCBiZWNhdXNlIDg3IGRlZ3JlZXMgc2VlbXMgb2sgdG8gc3RhcnQgZnJl
cXVlbmN5Cj4+IHRocm90dGxpbmcuIEJ1dCwgeWVzLCBpdCBzaG91bGQgYmUgcGFzc2l2ZS4KPj4g
Cj4+IDg3IGlzIHN0aWxsIHF1aXRlIGxvdyBpZiBJIGNvbXBhcmUgdGhpcyB0ZW1wZXJhdHVyZSB3
aXRoIHRoZQo+PiB3cnQzMjAwYWNtIE1hcnZlbGwgZHVhbCBjb3JlIGFybSBzb2MuIFRoZXkgZXZl
biB3ZW50IGFib3ZlIDEwMAo+PiBkZWdyZWVzIHNvIEkgZmVlbCBmb3IgYW4gYXJtIHByb2Nlc3Nv
ciBpbnNpZGUgYSByb3V0ZXIgYm94IGl0IGlzIGZpbmUKPj4gdG8gdXNlIDg3IGRlZ3JlZXMgQnV0
IG1heWJlIHNvbWVvbmUgYXQgTWVkaWF0ZWsgY2FuIGdpdmUgc29tZSBtb3JlCj4+IGRldGFpbHMg
YWJvdXQgb3BlcmF0aW5nIHRlbXBlcmF0dXJlcy4KPgo+U29tZXRpbWVzLCB0aGUgU29DIHZlbmRv
ciBwdXRzIGEgaGlnaCB0ZW1wZXJhdHVyZSBpbiB0aGUgRFQganVzdCB0bwo+ZXhwb3J0IHRoZSB0
aGVybWFsIHpvbmUgYW5kIGRlYWwgd2l0aCBpdCBmcm9tIHVzZXJzcGFjZS4gU28gcHV0dGluZyB0
aGUKPmhpZ2ggdGVtcCBhbGxvdyB0aGUgdXNlcnNwYWNlICh1c3VhbGx5IGEgdGhlcm1hbCBlbmdp
bmUgLSBBbmRyb2lkCj5zdHVmZikKPnRvIGRlYWwgd2l0aCB0aGUgbWl0aWdhdGlvbiB3aXRob3V0
IGEga2VybmVsIGludGVyYWN0aW9uLgo+Cj5IYXZpbmcgbW9yZSB0aGFuIDEwMMKwQyBjb3VsZCBi
ZSB0aGlzIGtpbmQgb2Ygc2V0dXAuIE9ubHkgdGhlIG9wZXJhdGluZwo+dGVtcGVyYXR1cmUgZnJv
bSB0aGUgaGFyZHdhcmUgZG9jdW1lbnRhdGlvbiB3aWxsIHRlbGwgdGhlIHNhZmUKPnRlbXBlcmF0
dXJlIGZvciB0aGUgc2lsaWNvbi4KPgo+SU1PLCA3N8KwQyBpcyBhIGdvb2QgY29tcHJvbWlzZSB1
bnRpbCBnZXR0aW5nIHRoZSBkb2N1bWVudGVkIHRlbXAuIDg3wrBDCj5zb3VuZHMgdG8gbWUgYSBi
aXQgdG9vIGhvdC4KPgo+PiBJdCBtYXkgYmUgcG9zc2libGUgdG8gbGVhdmUgdGhlIGFjdGl2ZSBt
YXAgaW4gdGhlIGRldmljZSB0cmVlIGFzIHNvbWUKPj4gdXNlcnMgb2YgdGhlIGJhbmFuYXBpIG1p
Z2h0IGNob29zZSB0byBpbnN0YWxsIGEgZmFuIGFzIGl0IGlzIG9uZSBvZgo+PiB0aGUgb3B0aW9u
cy4KPgo+VGhlIGFjdGl2ZSB0cmlwIG9ubHkgbWFrZXMgc2Vuc2UgaWYgdGhlIGNvb2xpbmcgZGV2
aWNlIGlzIGEgZmFuIChvciBhbnkKPmFjdGl2ZSBkZXZpY2UpLCBzbyB0aGUgbWFwcGluZyBwb2lu
dHMgdG8gYSBmYW4gbm9kZSwgbGlrZToKPgo+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdGhlcm1hbC9saW51eC5naXQvdHJlZS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JvY2tjaGlwL3JrMzM5OS1raGFkYXMtZWRnZS5kdHNpI24xOTIKPgo+SWYgdGhlcmUgaXMg
bm8gc3VjaCBbcHdtXSBmYW4gb3V0cHV0IG9uIHRoZSBib2FyZCwgbm8gYWN0aXZlIHRyaXAgcG9p
bnQKPnNob3VsZCBiZSBhZGRlZC4KPgo+PiDigaNHZXQgQmx1ZU1haWwgZm9yIEFuZHJvaWQg4oCL
Cj4+IAo+PiBPbiBKdW4gMjMsIDIwMjEsIDU6NTggUE0sIGF0IDU6NTggUE0sIERhbmllbCBMZXpj
YW5vCj4+IDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPj4+IE9uIDIzLzA2LzIw
MjEgMTc6MzUsIEVyaWMgV291ZHN0cmEgd3JvdGU6Cj4+Pj4gSXQgaXMgb25seSB1c2VmdWwgdG8g
c2V0IDEgbWFwIHdpdGggdGhlIHJlZ3VsYXRlZCB0ZW1wZXJhdHVyZSBmb3IKPj4+PiBjcHUgZnJl
cXVlbmN5IHRocm90dGxpbmcuIFNhbWUgYXMgaW4gdGhlIGtlcm5lbCBkb2N1bWVudAo+Pj4+IGV4
YW1wbGUuCj4+Pj4gCj4+Pj4gCj4+Pj4gSXQgaGFzIG5vIHVzZSB0byBzZXQgZnJlcXVlbmN5IHNj
YWxpbmcgb24gMiBkaWZmZXJlbnQKPj4+PiB0ZW1wZXJhdHVyZSB0cmlwIHBvaW50cywgYXMgdGhl
IGxvd2VzdCBvbmUgbWFrZXMgc3VyZSB0aGUgaGlnaGVyCj4+Pj4gb25lKHMpIGFyZSBuZXZlciBy
ZWFjaGVkLgo+Pj4gCj4+PiBJIGxvb2tlZCBtb3JlIGNsb3NlbHkgdGhlIERUIGFuZCB0aGVyZSBp
cyBhIG1pc3VuZGVyc3RhbmRpbmcgb2YKPj4+IHRoZSB0aGVybWFsIGZyYW1ld29yayBpbiB0aGUg
ZGVmaW5pdGlvbi4KPj4+IAo+Pj4gVGhlcmUgaXMgb25lIHRyaXAgcG9pbnQgd2l0aCB0aGUgcGFz
c2l2ZSB0eXBlIGFuZCB0aGUgY3B1IGNvb2xpbmcgCj4+PiBkZXZpY2UsIGZvbGxvd2VkIGJ5IGEg
c2Vjb25kIHRyaXAgcG9pbnQgd2l0aCB0aGUgYWN0aXZlIHR5cGUgKmJ1dCoKPj4+IHRoZSBzYW1l
IGNwdSBjb29saW5nIGRldmljZS4gVGhhdCBpcyB3cm9uZy4KPj4+IAo+Pj4gQW5kIGZpbmFsbHks
IHRoZXJlIGlzIHRoZSBob3QgdHJpcCBwb2ludCBhcyBhIHRoaXJkIG1hcHBpbmcgYW5kCj4+PiB0
aGUgc2FtZSBjb29saW5nIGRldmljZS4KPj4+IAo+Pj4gVGhlIGhvdCB0cmlwIHBvaW50IGlzIG9u
bHkgdGhlcmUgdG8gbm90aWZ5IHVzZXJzcGFjZSBhbmQgbGV0IGl0Cj4+PiB0YWtlIGFuIGltbWVk
aWF0ZSBhY3Rpb24gdG8gcHJldmVudCBhbiBlbWVyZ2VuY3kgc2h1dGRvd24gd2hlbgo+Pj4gcmVh
Y2hpbmcgdGhlIGNyaXRpY2FsIHRlbXBlcmF0dXJlLgo+Pj4gCj4+Pj4gSXQgY2FuIGJlIGFwcGxp
ZWQgb25seSBhdCAxIHRyaXAgcG9pbnQuIE11bHRpcGxlIHRyaXAgcG9pbnRzIGlzCj4+Pj4gb25s
eSB1c2VmdWxseSBmb3IgZmFuIGNvbnRyb2wgdG8gbWFrZSBzdXJlIHRoZSBmYW4gaXMgbm90IHRv
byAKPj4+PiBub2lzeSB3aGVuIGl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gYmUgbm9pc3kuCj4+Pj4g
Cj4+Pj4gCj4+Pj4gVGhlIENQVSB3aWxsIGFsbW9zdCBjb21lIHRvIGEgZGVhZCBzdG9wIHdoZW4g
aXQgc3RhcnRzIHRvIHBhc3MKPj4+PiB0aGUgbG93ZXN0IHRoZXJtYWwgbWFwIHdpdGggZnJlcXVl
bmN5IHRocm90dGxpbmcuCj4+Pj4gCj4+Pj4gVGhpcyBpcyB3aHkgaXQgaXMgYSBidWcgYW5kIG5l
ZWRzIGEgZml4LCBub3Qgb25seSBhZGp1c3RtZW50Lgo+Pj4gCj4+PiBZZXMsIHlvdSBhcmUgcmln
aHQuIEl0IHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZSAodmVyYmF0aW0gY29weSk6Cj4+PiAKPj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpIAo+
Pj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpIGluZGV4Cj4+PiA4
OTBhOTQyZWM2MDguLjg4YzgxZDI0ZjRmZiAxMDA2NDQgLS0tCj4+PiBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kgKysrCj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ3NjIyLmR0c2kgQEAgLTEzNiwyNCArMTM2LDE4IEBACj4+PiBzZWNtb25fcmVz
ZXJ2ZWQ6IHNlY21vbkA0MzAwMDAwMCB7Cj4+PiAKPj4+IHRoZXJtYWwtem9uZXMgeyBjcHVfdGhl
cm1hbDogY3B1LXRoZXJtYWwgeyAtCj4+PiBwb2xsaW5nLWRlbGF5LXBhc3NpdmUgPSA8MTAwMD47
ICsJCQlwb2xsaW5nLWRlbGF5LXBhc3NpdmUgPSA8MjUwPjsgCj4+PiBwb2xsaW5nLWRlbGF5ID0g
PDEwMDA+Owo+Pj4gCj4+PiB0aGVybWFsLXNlbnNvcnMgPSA8JnRoZXJtYWwgMD47Cj4+PiAKPj4+
IHRyaXBzIHsgY3B1X3Bhc3NpdmU6IGNwdS1wYXNzaXZlIHsgLQkJCQkJdGVtcGVyYXR1cmUgPSA8
NDcwMDA+OyArCj4+PiB0ZW1wZXJhdHVyZSA9IDw3NzAwMD47IGh5c3RlcmVzaXMgPSA8MjAwMD47
IHR5cGUgPSAicGFzc2l2ZSI7IH07Cj4+PiAKPj4+IC0JCQkJY3B1X2FjdGl2ZTogY3B1LWFjdGl2
ZSB7IC0JCQkJCXRlbXBlcmF0dXJlID0gPDY3MDAwPjsgLQo+Pj4gaHlzdGVyZXNpcyA9IDwyMDAw
PjsgLQkJCQkJdHlwZSA9ICJhY3RpdmUiOyAtCQkJCX07IC0gY3B1X2hvdDoKPj4+IGNwdS1ob3Qg
eyB0ZW1wZXJhdHVyZSA9IDw4NzAwMD47IGh5c3RlcmVzaXMgPSA8MjAwMD47IEBAIC0xNzMsMTgK
Pj4+ICsxNjcsNiBAQCBtYXAwIHsgY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19M
SU1JVAo+Pj4gVEhFUk1BTF9OT19MSU1JVD4sIDwmY3B1MSBUSEVSTUFMX05PX0xJTUlUIFRIRVJN
QUxfTk9fTElNSVQ+OyB9OyAtIAo+Pj4gLQkJCQltYXAxIHsgLQkJCQkJdHJpcCA9IDwmY3B1X2Fj
dGl2ZT47IC0JCQkJCWNvb2xpbmctZGV2aWNlID0KPj4+IDwmY3B1MCBUSEVSTUFMX05PX0xJTUlU
IFRIRVJNQUxfTk9fTElNSVQ+LCAtCQkJCQkJCSA8JmNwdTEKPj4+IFRIRVJNQUxfTk9fTElNSVQg
VEhFUk1BTF9OT19MSU1JVD47IC0JCQkJfTsgLSAtCQkJCW1hcDIgeyAtCj4+PiB0cmlwID0gPCZj
cHVfaG90PjsgLQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVAo+
Pj4gVEhFUk1BTF9OT19MSU1JVD4sIC0JCQkJCQkJIDwmY3B1MSBUSEVSTUFMX05PX0xJTUlUCj4+
PiBUSEVSTUFMX05PX0xJTUlUPjsgLQkJCQl9OyB9OyB9OyB9Owo+Pj4gCj4+PiAKPj4+IC0tIDxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IKPj4+IEFSTSBTb0NzCj4+PiAKPj4+IEZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8IAo+Pj4gPGh0dHA6Ly90d2l0dGVy
LmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfCAKPj4+IDxodHRwOi8vd3d3LmxpbmFyby5vcmcv
bGluYXJvLWJsb2cvPiBCbG9nCj4+IAo+Cj4KPi0tIAo+PGh0dHA6Ly93d3cubGluYXJvLm9yZy8+
IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29Dcwo+Cj5Gb2xs
b3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJv
b2sgfAo+PGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo+PGh0dHA6
Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
