Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E74C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 13:55:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3626B60F57
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 13:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3626B60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLXosTHbAj6gb0WmGqJ/RqnwaS89w46N5Tk5cdZ5aso=; b=KOqWABDamByDTb72nd2Zv7ko5r
	smMK9423Ug5Nz3/ML4fIK0QcdyuCwAiaMT1hxdvxEn1OGKRzTiTFYIZRzsAtgCLOPXIkvuuZTA2wr
	PePGVEPDrBGq3/pwplhN1GMFBRupTafD2mQHekSnWZKeUyivjK5deGwT7ZumeT+3pX8qqXjqavUkV
	k5/nI5koF7cd/zBjN1AF3OhVdrJDszCsj7+cPFCgBmyclKOJN7T4+8bY35XpDJIS49AbNAOh0UGKn
	aefUcSSVASR3dQ+8L7c7gOiRkz/YAGdnHjhO9IuYvRsQYzWBxlkRdHlUdBHNqyRoQyxI14m71DadQ
	bRypXpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEXeK-00CisU-Ao; Fri, 13 Aug 2021 13:55:04 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEXe1-00CinY-0p
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 13:54:49 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.51.24])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id BC4B22A006D;
 Fri, 13 Aug 2021 13:54:42 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 465F43C0026; Fri, 13 Aug 2021 13:54:41 +0000 (UTC)
Received: from [192.168.254.6] (unknown [50.34.183.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id CEFC713C2B1;
 Fri, 13 Aug 2021 06:54:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com CEFC713C2B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1628862880;
 bh=5tKunBAwMnPdA7f4AkB8bCitDfhGrzhL+wAN4/LW8Ek=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gz+xfbYwr10CiYKi0hg11kPXyeK8FKaIEqWm8Gvx4XAoQnJcQl6lbZ6Tn4iZekUYv
 fuBEHtodw38xvB+GFNyZeD9KkPMoo9heiaohDKqZRFvyeO44ZKyJhMTmXUP/sJslFv
 zLfsuZTnE5/2mUiLzYPP2pxiK3xDweuOPI7Cku2E=
Subject: Re: [PATCH v4 1/2] mt76: mt7915: fix hwmon temp sensor mem
 use-after-free
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <9f5b0cf6c4296d3a9e78a95516cf26d1db4baba9.1627696765.git.ryder.lee@mediatek.com>
 <04c61f83-e4ce-536f-7030-9050d8edfe78@nbd.name>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <44c91410-49db-b829-a69a-f9826c8ff3ee@candelatech.com>
Date: Fri, 13 Aug 2021 06:54:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <04c61f83-e4ce-536f-7030-9050d8edfe78@nbd.name>
Content-Language: en-MW
X-MDID: 1628862883-Ux-78EVqV1pL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_065445_190561_7226930D 
X-CRM114-Status: GOOD (  17.87  )
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

T24gOC8xMy8yMSAzOjE1IEFNLCBGZWxpeCBGaWV0a2F1IHdyb3RlOgo+IAo+IE9uIDIwMjEtMDct
MzEgMDQ6MTcsIFJ5ZGVyIExlZSB3cm90ZToKPj4gRnJvbTogQmVuIEdyZWVhciA8Z3JlZWFyYkBj
YW5kZWxhdGVjaC5jb20+Cj4+Cj4+IFdpdGhvdXQgdGhpcyBjaGFuZ2UsIGdhcmJhZ2UgaXMgc2Vl
biBpbiB0aGUgaHdtb24gbmFtZQo+PiBhbmQgc2Vuc29ycyBvdXRwdXQgZm9yIG10NzkxNSBpcyBn
YXJibGVkLgo+IFdoZXJlIGRvZXMgdGhlIHVzZS1hZnRlci1mcmVlIGJ1ZyBjb21lIGZyb20/IEl0
J3Mgbm90IG9idmlvdXMgdG8gbWUgd2h5Cj4gdXNpbmcgS0JVSUxEX01PRE5BTUUgaW5zdGVhZCBv
ZiB3aXBoeV9uYW1lKCkgZml4ZXMgaXQuCj4gSSBzdGlsbCB0aGluayB0aGUgcGh5IG5hbWUgc2hv
dWxkIHByb2JhYmx5IGJlIHBhcnQgb2YgdGhlIHByZWZpeC4KCldlIHJlbmFtZSBwaHkgZGV2aWNl
cyBhcyBwYXJ0IG9mIG91ciBub3JtYWwgb3BlcmF0aW9uLCBJIHRoaW5rIG1heWJlCnRoYXQgaGVs
cHMgdHJpZ2dlciB0aGUgYnVnLgoKSXQgYXBwZWFycyB0aGF0IHRoZSBod21vbiBsb2dpYyBkb2Vz
IG5vdCBtYWtlIGEgY29weSBvZiB0aGUgaW5jb21pbmcgc3RyaW5nLApidXQgaW5zdGVhZCBqdXN0
IGNvcGllcyBhIGNoYXIqIGFuZCBleHBlY3RzIGl0IHRvIG5ldmVyIGdvIGF3YXkuICBCdXQsCkkg
ZGlkIG5vdCBhY3R1YWxseSB2ZXJpZnkgdGhhdC4KClRoYW5rcywKQmVuCgo+IAo+PiBXaXRoIHRo
ZSBjaGFuZ2U6Cj4+Cj4+IG10NzkxNS1wY2ktMTQwMAo+PiBBZGFwdGVyOiBQQ0kgYWRhcHRlcgo+
PiB0ZW1wMTogICAgICAgICs0OS4wwrBDCj4+Cj4+IEZpeGVzOiBkNjkzODI1MWJiNWIgKG10NzY6
IG10NzkxNTogYWRkIHRoZXJtYWwgc2Vuc29yIGRldmljZSBzdXBwb3J0KQo+IFRoZSBmb3JtYXQg
aXMgd3JvbmcgKG1pc3NpbmcgcXVvdGVzKSwgYW5kIHRoZSBoYXNoIHJlZmVyZW5jZXMgYSBjb21t
aXQKPiB0aGF0J3Mgbm90IGluIGFueSB1cHN0cmVhbSB0cmVlLgo+IAo+IC0gRmVsaXgKPiAKCgot
LSAKQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+CkNhbmRlbGEgVGVjaG5vbG9n
aWVzIEluYyAgaHR0cDovL3d3dy5jYW5kZWxhdGVjaC5jb20KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
