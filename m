Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2664C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 18:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nqZfcJhabMm4wj2TugiaRAwOMZ6mPHb+aOq0Qy6kCJk=; b=cdUhpDvwGDjH5b
	HXnhHUdB1SqLYSs4YN7EUCLURVB+h/ifuG24aKXSIdUtxv5P018zZEbFqS9HYErW0wQOyPAV9+m+4
	mzXvatkJMBbJu/SBZPS2SWnlhUnGDSZQUJkpAImMSDLwlZXSHekvwFTBtff/GQVnm2M9oPftrT4I/
	pKR5LSaSajSp0mERPKtjQpvoatu6dciPMYWM+C6umLAwaEzNl1feiu40GR5+aGRrarxvHzDcAVNnl
	daCb3CbE+L6ZxS4cSXJMFsLP8fD+egGzRIEs9WpEgMn5YAP5fTNHz7q6pIW6Hvhl4RWuv97ZELWKR
	rlfoJPB3yaQHqs1lbOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5tw7-004sQ6-TZ; Fri, 07 Jan 2022 18:25:59 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5tv6-004s1Y-P4; Fri, 07 Jan 2022 18:25:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id r10so4985470wrc.3;
 Fri, 07 Jan 2022 10:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aMZSPHzmKlp4nB0z4xKj0z3g/eSIybOBv9g3NZ7AxBc=;
 b=quivSkBIqvYx7HHIhNcVzJMk1g2PqMCIZD1U/C28SoY52KIZVa5erqh7Ecy9Tc/uZY
 xy4im3rnanh7XX52x+uEDm25eQrSTTTTbNHMWzskQJXewA8l7Hv96MPweGA/piN6vemc
 QVv2Q40zjmLPAkJb+NzuKcX+moy8OXQKB+eokdpiJE08XFhpn0xuE9Y0PsEAAJd29Wem
 7htfnQKkQ5q7zRBKjmd3VSX0H9hNVHQib++OsGrYO+xrumfrsa18w+sFaev6RmewTxf6
 A22wpqc3XnTwBa1i+0U1Vw9ykX9ZeZVRW1vvsZybcWbe5bdOjkgO1PPHNCfPXIwgn5t/
 H8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aMZSPHzmKlp4nB0z4xKj0z3g/eSIybOBv9g3NZ7AxBc=;
 b=WcQa6b34AWS8eFQeKBWh5dP5baNcPTt6hywvJy/X2lTqCBTSVhrM63SY2BqWLJ1//Y
 RM6cFfDiyCnMeV+1A8Y06JaPr5/Rrs0VaTxFvCVmJcvu9Tq7dLPKKWdoJ8fk3WAHfe3I
 W4+/x0VnpRnx0nhxXcd6Fs7XquaNB+aebfE7QqD5ehzSPkA2ioOg4o6J4l4JfmvjPjb4
 djqO57D5OEKsY9YyiHv0CRh+I9e9uu4byTwxojiRYmGZWFWn0EtTmPzm7C0s6yzgmE0g
 fhIbORy5Kx1Rw4S/58ratwZ0Zg9WPOQo3tN3eEhELKgXNdwzls+O180uyOpgyAfeajnY
 C1uA==
X-Gm-Message-State: AOAM530C/plSpXruv8gxizV6SVFJImf73feA/p4mAgQklZA+Jd+qzpOo
 6XfE/L/MXsb+awwKHfiEqGw=
X-Google-Smtp-Source: ABdhPJxIMdZG2/mErKh1SRRIvGw8qzcobjoNHtD+/pns9H9ulLIrwuZ3L3ZaYlzt5h+xMKGoMXaS6g==
X-Received: by 2002:a05:6000:2a9:: with SMTP id
 l9mr55607369wry.71.1641579894699; 
 Fri, 07 Jan 2022 10:24:54 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g18sm5305938wrv.42.2022.01.07.10.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:24:54 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, ikjn@chromium.org,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH RESEND v2] clk: mediatek: Fix memory leaks on probe
Date: Fri,  7 Jan 2022 19:24:51 +0100
Message-Id: <20220107182451.139456-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_102456_888322_5E656688 
X-CRM114-Status: GOOD (  11.57  )
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

SGFuZGxlIHRoZSBlcnJvciBicmFuY2hlcyB0byBmcmVlIG1lbW9yeSB3aGVyZSByZXF1aXJlZC4K
CkFkZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTQ5MTgyNSAoIlJlc291cmNlIGxlYWsiKQpTaWduZWQt
b2ZmLWJ5OiBKb3PDqSBFeHDDs3NpdG8gPGpvc2UuZXhwb3NpdG84OUBnbWFpbC5jb20+ClJldmll
d2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVtLm9yZz4KCi0tLQoKdjI6IEFkZCBS
ZXZpZXdlZC1ieSB0YWcKLS0tCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLmMgfCAz
NiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXQ4MTkyLmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLmMKaW5k
ZXggY2JjN2M2ZGJlMGY0Li43OWRkYjNjYzBiOTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDgxOTIuYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTky
LmMKQEAgLTEyMzYsOSArMTIzNiwxNyBAQCBzdGF0aWMgaW50IGNsa19tdDgxOTJfaW5mcmFfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXIgPSBtdGtfY2xrX3JlZ2lzdGVy
X2dhdGVzKG5vZGUsIGluZnJhX2Nsa3MsIEFSUkFZX1NJWkUoaW5mcmFfY2xrcyksIGNsa19kYXRh
KTsKIAlpZiAocikKLQkJcmV0dXJuIHI7CisJCWdvdG8gZnJlZV9jbGtfZGF0YTsKKworCXIgPSBv
Zl9jbGtfYWRkX3Byb3ZpZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2VsbF9nZXQsIGNsa19kYXRh
KTsKKwlpZiAocikKKwkJZ290byBmcmVlX2Nsa19kYXRhOworCisJcmV0dXJuIHI7CiAKLQlyZXR1
cm4gb2ZfY2xrX2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtf
ZGF0YSk7CitmcmVlX2Nsa19kYXRhOgorCW10a19mcmVlX2Nsa19kYXRhKGNsa19kYXRhKTsKKwly
ZXR1cm4gcjsKIH0KIAogc3RhdGljIGludCBjbGtfbXQ4MTkyX3BlcmlfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKQEAgLTEyNTMsOSArMTI2MSwxNyBAQCBzdGF0aWMgaW50IGNs
a19tdDgxOTJfcGVyaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJciA9
IG10a19jbGtfcmVnaXN0ZXJfZ2F0ZXMobm9kZSwgcGVyaV9jbGtzLCBBUlJBWV9TSVpFKHBlcmlf
Y2xrcyksIGNsa19kYXRhKTsKIAlpZiAocikKLQkJcmV0dXJuIHI7CisJCWdvdG8gZnJlZV9jbGtf
ZGF0YTsKKworCXIgPSBvZl9jbGtfYWRkX3Byb3ZpZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2Vs
bF9nZXQsIGNsa19kYXRhKTsKKwlpZiAocikKKwkJZ290byBmcmVlX2Nsa19kYXRhOwogCi0JcmV0
dXJuIG9mX2Nsa19hZGRfcHJvdmlkZXIobm9kZSwgb2ZfY2xrX3NyY19vbmVjZWxsX2dldCwgY2xr
X2RhdGEpOworCXJldHVybiByOworCitmcmVlX2Nsa19kYXRhOgorCW10a19mcmVlX2Nsa19kYXRh
KGNsa19kYXRhKTsKKwlyZXR1cm4gcjsKIH0KIAogc3RhdGljIGludCBjbGtfbXQ4MTkyX2FwbWl4
ZWRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKQEAgLTEyNzEsOSArMTI4Nywx
NyBAQCBzdGF0aWMgaW50IGNsa19tdDgxOTJfYXBtaXhlZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCW10a19jbGtfcmVnaXN0ZXJfcGxscyhub2RlLCBwbGxzLCBBUlJBWV9T
SVpFKHBsbHMpLCBjbGtfZGF0YSk7CiAJciA9IG10a19jbGtfcmVnaXN0ZXJfZ2F0ZXMobm9kZSwg
YXBtaXhlZF9jbGtzLCBBUlJBWV9TSVpFKGFwbWl4ZWRfY2xrcyksIGNsa19kYXRhKTsKIAlpZiAo
cikKLQkJcmV0dXJuIHI7CisJCWdvdG8gZnJlZV9jbGtfZGF0YTsKIAotCXJldHVybiBvZl9jbGtf
YWRkX3Byb3ZpZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2VsbF9nZXQsIGNsa19kYXRhKTsKKwly
ID0gb2ZfY2xrX2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtf
ZGF0YSk7CisJaWYgKHIpCisJCWdvdG8gZnJlZV9jbGtfZGF0YTsKKworCXJldHVybiByOworCitm
cmVlX2Nsa19kYXRhOgorCW10a19mcmVlX2Nsa19kYXRhKGNsa19kYXRhKTsKKwlyZXR1cm4gcjsK
IH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2ZfbWF0Y2hfY2xrX210ODE5
MltdID0gewotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
