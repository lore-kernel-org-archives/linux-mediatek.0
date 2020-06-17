Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880E3C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 08:03:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D78021475
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 08:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdP9T7Rt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7fvTs+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D78021475
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R23JCpDf0KWmV11sSeU3g2bTzVP2RQp3IlJBRtF1BgA=; b=pdP9T7RtnEVY1M
	6MQEvRkT2nRFOxBTTDHsIs6cDhsrJ7azwufMDdWmp4Yh97GKLPUDM+Z8qWyBO8O1U8pPAb2AHwwfM
	DDuIUgakNCRL2mPzM0P6sxnlpjgEkDTqD+vOl3Py3QGh9v8Zh5YPijHLVOQ/crOvtl4/WXvqcUKKL
	MMr8/3YWOHCU+PSyMUCVqgflMgpKoFlakg95sJLbbeLy4PnGKuCZjZ6RkE+0vVQb/U35OauZ9J2AW
	NxZMMIEVW1rSE7cx4ZeKmiFwWsq3Sjko4jHhGrVaE1wR9s49f+M7gTfPVYfne9pj/J2AmfsfjuLes
	MkIv8ekw0K5HKhDICniw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlT2s-0002OA-Op; Wed, 17 Jun 2020 08:03:42 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlT2m-0002JB-0n; Wed, 17 Jun 2020 08:03:39 +0000
Received: by mail-ej1-x643.google.com with SMTP id o15so1271964ejm.12;
 Wed, 17 Jun 2020 01:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IoLOTj4N/UivUbV7Xr+eQksZLmcOCCkaL8Z2FZzpaSE=;
 b=n7fvTs+/AIa8pMpfW6aPzMLlPj+Dgki9bUAxy/WJhTzuhCBbd+H1VjHgPGq499Rpv/
 5d/Fu/pYEKH1b6nUOp+B/0rVShHG5a3F5X6E9yohIERXhGRB+jfz7fG7aLScoIpx8e+F
 hoa3YKo1A1lDCasydfb4WIy1UyVUOIk9DfVXXMnVNv4WGz8gFNusqZ8XbJsGTDUN9Fqb
 G31mdXjKpT3KyemJTlD9XocjfZeFc/GyLV2zWtdzsLpQAbvFvS3y1YSYDd18MIgGQFXl
 /yNkjvwU7T7hVY2TKYobQ4wa9+HTev7V+Zm0ABk5R4hLFzxjXuIxIeh+PmN3kmrE6ePT
 RYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IoLOTj4N/UivUbV7Xr+eQksZLmcOCCkaL8Z2FZzpaSE=;
 b=A879pfgTQsT4tOEE55GedWYm5aqEpe6mFyzh8pkImqNVc2higKgJQH+/6Z4Nc1egxm
 kgOACn+x++tYZRrloIJzhuRkOG2cZkCFSxAfX1FLwi3w28taquRry2ZCBKDShUFmvDD1
 RvXJaGETaxozfpd7In5SuqmAGqGk/oTCE53pvFOq0d1dOzqz4ccV/GBf31bMslu31VIr
 EquIDvka5flqQ9OTmd4PJhDndZVcVzuOwo4TZGscOu2uVmXlyqeLcWM/u/y8FtE5gnU/
 43cGoz9cjOlJD2rles11mKpsot7qbFwWCE2VEDtKnjoOsgcQLwsyDU2r4VbQ8MWwRCYG
 Bcew==
X-Gm-Message-State: AOAM533lzC5EQWhpgXeszAQkYiHSHs1X74y2qZ6zIXuYuWWbpR+J+WYa
 9OZ/wOF13NXxFn9aVKbSvhA=
X-Google-Smtp-Source: ABdhPJwEiLAyKqBWSBg/9gW1RJJ++WW+xletvVfauJvMuZRCPanBDVczGoSWbdvhRqSEjwIJMjoADg==
X-Received: by 2002:a17:906:1149:: with SMTP id
 i9mr6779545eja.100.1592381013809; 
 Wed, 17 Jun 2020 01:03:33 -0700 (PDT)
Received: from [10.31.1.6] ([194.187.249.54])
 by smtp.gmail.com with ESMTPSA id n16sm12971271ejl.70.2020.06.17.01.03.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 01:03:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
From: Jo -l <joel.voyer@gmail.com>
In-Reply-To: <20200617003711.GD8681@bombadil.infradead.org>
Date: Wed, 17 Jun 2020 10:03:30 +0200
Message-Id: <29829792-2C3E-44D1-A337-E206F1B6C92A@gmail.com>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_010336_111820_F66132FD 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 dsterba@suse.cz, David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Qm9uam91ciwKRMOpc29sw6ksIGF1Y3VuZSB0cmFkdWN0aW9uIHBvc3NpYmxlLCAKRW4gZnJhbsOn
YWlzIHBvdXIgY29tcHJlbmRyZSEKTWVyY2kKc2x0cwoKPiBMZSAxNyAwNiAyMDIwIMOgIDAyOjM3
LCBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gYSDDqWNyaXQgOgo+IAo+IE9u
IFdlZCwgSnVuIDE3LCAyMDIwIGF0IDAxOjAxOjMwQU0gKzAyMDAsIERhdmlkIFN0ZXJiYSB3cm90
ZToKPj4gT24gVHVlLCBKdW4gMTYsIDIwMjAgYXQgMTE6NTM6NTBBTSAtMDcwMCwgSm9lIFBlcmNo
ZXMgd3JvdGU6Cj4+PiBPbiBNb24sIDIwMjAtMDYtMTUgYXQgMjE6NTcgLTA0MDAsIFdhaW1hbiBM
b25nIHdyb3RlOgo+Pj4+IHY0Ogo+Pj4+IC0gQnJlYWsgb3V0IHRoZSBtZW16ZXJvX2V4cGxpY2l0
KCkgY2hhbmdlIGFzIHN1Z2dlc3RlZCBieSBEYW4gQ2FycGVudGVyCj4+Pj4gIHNvIHRoYXQgaXQg
Y2FuIGJlIGJhY2twb3J0ZWQgdG8gc3RhYmxlLgo+Pj4+IC0gRHJvcCB0aGUgImNyeXB0bzogUmVt
b3ZlIHVubmVjZXNzYXJ5IG1lbXplcm9fZXhwbGljaXQoKSIgcGF0Y2ggZm9yCj4+Pj4gIG5vdyBh
cyB0aGVyZSBjYW4gYmUgYSBiaXQgbW9yZSBkaXNjdXNzaW9uIG9uIHdoYXQgaXMgYmVzdC4gSXQg
d2lsbCBiZQo+Pj4+ICBpbnRyb2R1Y2VkIGFzIGEgc2VwYXJhdGUgcGF0Y2ggbGF0ZXIgb24gYWZ0
ZXIgdGhpcyBvbmUgaXMgbWVyZ2VkLgo+Pj4gCj4+PiBUbyB0aGlzIGxhcmdlciBhdWRpZW5jZSBh
bmQgbGFzdCB3ZWVrIHdpdGhvdXQgcmVwbHk6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzU3M2IzZmJkNTkyN2M2NDM5MjBlMTM2NDIzMGMyOTZiMjNlNzU4NGQuY2FtZWxAcGVyY2hl
cy5jb20vCj4+PiAKPj4+IEFyZSB0aGVyZSBfYW55XyBmYXN0cGF0aCB1c2VzIG9mIGtmcmVlIG9y
IHZmcmVlPwo+PiAKPj4gSSdkIGNvbnNpZGVyIGtmcmVlIHBlcmZvcm1hbmNlIGNyaXRpY2FsIGZv
ciBjYXNlcyB3aGVyZSBpdCBpcyBjYWxsZWQKPj4gdW5kZXIgbG9ja3MuIElmIHBvc3NpYmxlIHRo
ZSBrZnJlZSBpcyBtb3ZlZCBvdXRzaWRlIG9mIHRoZSBjcml0aWNhbAo+PiBzZWN0aW9uLCBidXQg
d2UgaGF2ZSByYnRyZWVzIG9yIGxpc3RzIHRoYXQgZ2V0IGRlbGV0ZWQgdW5kZXIgbG9ja3MgYW5k
Cj4+IHJlc3RydWN0dXJpbmcgdGhlIGNvZGUgdG8gZG8gZWcuIHNwbGljZSBhbmQgZnJlZSBpdCBv
dXRzaWRlIG9mIHRoZSBsb2NrCj4+IGlzIG5vdCBhbHdheXMgcG9zc2libGUuCj4gCj4gTm90IGp1
c3QgcGVyZm9ybWFuY2UgY3JpdGljYWwsIGJ1dCBjb3JyZWN0bmVzcyBjcml0aWNhbC4gIFNpbmNl
IGt2ZnJlZSgpCj4gbWF5IGFsbG9jYXRlIGZyb20gdGhlIHZtYWxsb2MgYWxsb2NhdG9yLCBJIHJl
YWxseSB0aGluayB0aGF0IGt2ZnJlZSgpCj4gc2hvdWxkIGFzc2VydCB0aGF0IGl0J3MgIWluX2F0
b21pYygpLiAgT3RoZXJ3aXNlIHdlIGNhbiBnZXQgaW50byB0cm91YmxlCj4gaWYgd2UgZW5kIHVw
IGNhbGxpbmcgdmZyZWUoKSBhbmQgaGF2ZSB0byB0YWtlIHRoZSBtdXRleC4KCkpvLWwKam9lbC52
b3llckBnbWFpbC5jb20KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
