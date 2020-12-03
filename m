Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B32C63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:51:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F00C2084C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F00C2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=boldwhite24.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2yZVXUzZ42heE8uLz8g0qaaGc3HDJ+XhJMAKScG/gWk=; b=sMkyTgYz1TdspQQBPyI+KlPHJd
	o3F0n98JZvySszhNfvpQTEkdQWyPvyARnrq+HUC+5/uV27nW1lJcqM2YHmkdFgBbs/rB1rTKVSmdm
	JDTAkotvT3DpE34+w29T2yFq1UflHjuwx+FSBFqbyxGWH1QMYr8u0zgs2CkUsCY4FsPrvgMR3h8so
	BRJQyl3tnDvlFhsm72r69t9Ee1Zt8monWskTEkd9dSgSGUe62IWMydsItesd2Ue1MafQ1+cx0EgEf
	DyFWAVRO1L0SDYtdwKXQP+vhIz6sn8YR7KmYorqBD6oQ7sLaPgI3ky0gs9q0S1BWOn5Fb53NxBjEi
	d3vrAm+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkkKm-0007Oe-Tt; Thu, 03 Dec 2020 08:51:28 +0000
Received: from mail.boldwhite24.com ([80.211.42.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkkKl-0007NX-9o
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 08:51:28 +0000
Received: by mail.boldwhite24.com (Postfix, from userid 1001)
 id EA624A333D; Thu,  3 Dec 2020 08:50:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=boldwhite24.com;
 s=mail; t=1606985452;
 bh=hS3ibs4caZkahrzgcMN2TAJo2B2H5Muwb2NidDYlIzQ=;
 h=Date:From:To:Subject:From;
 b=RrabObv9v2R2f1KdInIFGqxhNiNt8qYF81EVWP4HOowQ7IozACoeKIwHs/MRLCoX5
 WJDwTTpy1PDmbkN/gTWeAtdBs7DE+Shyd4yF+4DsRsFXnm17gHSvg4kpKnHF84keOF
 Yq5k8g/Rp677/YveWnuN3XTG8RzIqzyAt0iP8wbLYNAzO7N+R1nzCSNDMx7oKHD6Zk
 FtObqThj+7uJqq+zAPTKFE3RcHsD1KuUEvfe09i3R2IlDnxc7pvMz6hSTdc80kStdk
 rzQRohdApLpGk5rXyPOk4JFXVs2jC9KOEZ+WyNObb9lbWL0+OHE2XYkEff1LsAoWz4
 tNtkG9JqI9ccQ==
Received: by mail.boldwhite24.com for <linux-mediatek@lists.infradead.org>;
 Thu,  3 Dec 2020 08:50:11 GMT
Message-ID: <20201203074501-0.1.2m.anht.0.9bh19vo9o8@boldwhite24.com>
Date: Thu,  3 Dec 2020 08:50:11 GMT
From: =?UTF-8?Q?"Diego_S=C3=A1nchez"?= <diego.sanchez@boldwhite24.com>
To: <linux-mediatek@lists.infradead.org>
Subject: Disinfection
X-Mailer: mail.boldwhite24.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_035127_556128_5D18FF81 
X-CRM114-Status: UNSURE (   0.57  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

R29vZCBtb3JuaW5nLAoKbG9va2luZyBmb3IgY29tcGFuaWVzIGludGVyZXN0ZWQgaW4gcmFpc2lu
ZyBhZGRpdGlvbmFsIGNhcGl0YWwgYnkgZGl2ZXJzaWZ5aW5nIHRoZWlyIG9mZmVyIGluIHNvYXBz
LCBsaXF1aWRzIGFuZCBnZWxzIGZvciBoYW5kIGRpc2luZmVjdGlvbiBhbmQgY29zbWV0aWNzIGZv
ciBib2R5IGFuZCBoYWlyIGNhcmUuCgpUaGUgZGlzdHJpYnV0aW9uIG9mIGlubm92YXRpdmUgcHJv
ZHVjdHMgY29ycmVzcG9uZGluZyB0byB0aGUgY3VycmVudCBwcmVmZXJlbmNlcyBvZiBjdXN0b21l
cnMgaW4gdGhlIGZpZWxkIG9mIGh5Z2llbmUgYW5kIHByZXZlbnRpdmUgaGVhbHRoY2FyZSBhbGxv
d3Mgb3VyIHBhcnRuZXJzIHRvIGdhaW4gbmV3IG1hcmtldHMgYW5kIGFjaGlldmUgYmV0dGVyIGVj
b25vbWljIHJlc3VsdHMuCgpJbiBhZGRpdGlvbiB0byBwcm9kdWN0cyB3aXRoIGJhY3RlcmljaWRh
bCBhY3Rpb24sIG91ciByYW5nZSBpbmNsdWRlcyBzaG93ZXIgZ2Vscywgc2hhbXBvb3MgYW5kIGhh
aXIgY29uZGl0aW9uZXJzLCBhcyB3ZWxsIGFzIGVmZmljaWVudCwgY29uY2VudHJhdGVkIGRldGVy
Z2VudHMuCgpUaGUgdmVyc2F0aWxpdHkgKHN1aXRhYmxlIGZvciBhbGwgc2tpbiB0eXBlcykgY29t
YmluZWQgd2l0aCBhbiBhZmZvcmRhYmxlIHByaWNlIG1lYW5zIHRoYXQgY3VzdG9tZXJzIG1ha2Ug
YW4gaW5mb3JtZWQgY2hvaWNlIG9mIGEgcHJvZHVjdCBhbW9uZyBvdGhlcnMgYXZhaWxhYmxlIG9u
IHRoZSBtYXJrZXQuCgpBcmUgeW91IGludGVyZXN0ZWQgaW4gY29vcGVyYXRpb24/CgpEaWVnbyBT
w6FuY2hlegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
