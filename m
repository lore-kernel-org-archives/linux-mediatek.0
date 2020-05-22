Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098C2C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:41:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFEB12072C
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UXyLUdhR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="fopXAkzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFEB12072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzoCcsx0u8Jl2RY7MXelh/ix6FLf8ZgUomCAtjxEP6A=; b=UXyLUdhRIW7ZCF
	lIM7uKScVfmqaIR+0SsextEvOvfH9PXTCgXnoMSA5yllIwEJXi2CDxI6FtuSYUPHCDQXO5Clplkxy
	L3MsP6J/FI16KtBn+TlZ2sX7tngP+3c5TC8Gqt+ORM7yGraZXOqYhM1Cr5sJ3AeMBTIXtqQ6xeoRL
	AxUCUsg3qIiekj4SHJpfulKplTeG6q5scl6dsIWbpAKzIFRXDJU5sR8FGVNCis630nzAoSMoUjPLf
	5oiiO87Qs5gv/L3dVW+wH3/jR5DUap29wi2q5zZkjzsm2/dPdAgtH3JkoWQgFt5xqCDZy43vvm8Tm
	aCT6HFDzQVnTvwG61mFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6yw-0007Ik-L8; Fri, 22 May 2020 12:40:58 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6ys-0007IB-UL
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 12:40:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590151254; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=oh+42u1jD0lF3Mak7Y5plxChvFaOqSnyizeGieH43rM=;
 b=fopXAkzpZvaPl1tTp3tpfrkK5r0ZmOgIENudMy+R3zT/mzYGCiUUj/LYVBx7bxFiZ5LSAkdF
 Kf1ebUx5PAi5PC5SsyK5ExKRSGm7ZDKfTuaPbZNHleDo1mYsCqvJrTs4gZo3ejFh6PkWYFxI
 ThpXHVfXmRKfPen93qLJKkyK41U=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec7c8558075f6e58c91eda9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 12:40:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9E1B0C433CA; Fri, 22 May 2020 12:40:52 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C56E6C433C6;
 Fri, 22 May 2020 12:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C56E6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH -next] mt76: mt7915: Fix build error
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200522034533.61716-1-yuehaibing@huawei.com>
References: <20200522034533.61716-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200522124052.9E1B0C433CA@smtp.codeaurora.org>
Date: Fri, 22 May 2020 12:40:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_054055_043134_924BF52B 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: ryder.lee@mediatek.com, YueHaibing <yuehaibing@huawei.com>,
 linux-wireless@vger.kernel.org, yf.luo@mediatek.com,
 chih-min.chen@mediatek.com, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, yiwei.chung@mediatek.com,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org, shayne.chen@mediatek.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZToKCj4gSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9maXJtd2FyZS5oOjY6MCwKPiAgICAgICAgICAgICAg
ICAgIGZyb20gZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWN1LmM6
NDoKPiBJbiBmdW5jdGlvbiDigJhfX210NzkxNV9tY3VfbXNnX3NlbmTigJksCj4gICAgIGlubGlu
ZWQgZnJvbSDigJhtdDc5MTVfbWN1X3NlbmRfbWVzc2FnZeKAmSBhdCBkcml2ZXJzL25ldC93aXJl
bGVzcy9tZWRpYXRlay9tdDc2L210NzkxNS9tY3UuYzozNzA6NjoKPiAuL2luY2x1ZGUvbGludXgv
Y29tcGlsZXIuaDozOTY6Mzg6IGVycm9yOiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0
XzU0NeKAmSBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxl
ZDogY21kID09IE1DVV9FWFRfQ01EX0VGVVNFX0FDQ0VTUyAmJiBtY3VfdHhkLT5zZXRfcXVlcnkg
IT0gTUNVX1FfUVVFUlkKPiAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9f
Y29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18pCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCj4gLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6Mzc3OjQ6IG5v
dGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19jb21waWxldGltZV9hc3NlcnTigJkKPiAg
ICAgcHJlZml4ICMjIHN1ZmZpeCgpOyAgICBcCj4gICAgIF5+fn5+fgo+IC4vaW5jbHVkZS9saW51
eC9jb21waWxlci5oOjM5NjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX2NvbXBp
bGV0aW1lX2Fzc2VydOKAmQo+ICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywg
X19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKPiAgIF5+fn5+fn5+fn5+fn5+fn5+
fn4KPiAuL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDigJhjb21waWxldGltZV9hc3NlcnTigJkKPiAgI2RlZmluZSBCVUlMRF9CVUdf
T05fTVNHKGNvbmQsIG1zZykgY29tcGlsZXRpbWVfYXNzZXJ0KCEoY29uZCksIG1zZykKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gLi9p
bmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjUwOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhCVUlMRF9CVUdfT05fTVNH4oCZCj4gICBCVUlMRF9CVUdfT05fTVNHKGNvbmRpdGlvbiwg
IkJVSUxEX0JVR19PTiBmYWlsZWQ6ICIgI2NvbmRpdGlvbikKPiAgIF5+fn5+fn5+fn5+fn5+fn4K
PiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkxNS9tY3UuYzoyODA6Mjog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19PTuKAmQo+ICAgQlVJTERf
QlVHX09OKGNtZCA9PSBNQ1VfRVhUX0NNRF9FRlVTRV9BQ0NFU1MgJiYKPiAgIF5+fn5+fn5+fn5+
fgo+IAo+IEJVSUxEX0JVR19PTiBpcyBtZWFuaW5nbGVzcyBoZXJlLCBjaGFuZyBpdCB0byBXQVJO
X09OLgo+IAo+IEZpeGVzOiBlNTdiNzkwMTQ2OWYgKCJtdDc2OiBhZGQgbWFjODAyMTEgZHJpdmVy
IGZvciBNVDc5MTUgUENJZS1iYXNlZCBjaGlwc2V0cyIpCj4gU2lnbmVkLW9mZi1ieTogWXVlSGFp
YmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKUGF0Y2ggYXBwbGllZCB0byB3aXJlbGVzcy1k
cml2ZXJzLW5leHQuZ2l0LCB0aGFua3MuCgo0NzJmMGEyNDAyNTAgbXQ3NjogbXQ3OTE1OiBGaXgg
YnVpbGQgZXJyb3IKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNTY0
NTk1LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1
bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
