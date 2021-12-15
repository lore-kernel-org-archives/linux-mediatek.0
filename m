Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77976C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nqZfcJhabMm4wj2TugiaRAwOMZ6mPHb+aOq0Qy6kCJk=; b=rfTHTm5AhBKzG2
	2DmrxADXzcmFqMOtyUPQcM5943/3IKqN6K746ZrRcaW3saBwynb1J+I1n25DWwrwGLF5TfjMIxsrn
	iIQHFUsTyUEHvucL1HNXDrvcS/Ntu6op85+JqxTetrrz4Aqlh0du/IVjjkFGOeG+9guBTjzoJ7H9B
	lytSRPRs3RD2kCbDoLB8J77gvRMHKlubd47ll7dhFaHnOTz8u3yud8q7Mo9tGeHX/OHjNLyUsU3rI
	ru4mF7KpOSplc30ugYjefrvTNwqDNWDM9q5nC9T4NFeufOx0UyS6JqFJ8Jd2E++sEZv73GM3eogo9
	pMHtB+XlMqzizgzsbJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxOjW-00HDYE-TI; Wed, 15 Dec 2021 07:29:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxOj7-00HDP3-03; Wed, 15 Dec 2021 07:29:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so15361044wms.3; 
 Tue, 14 Dec 2021 23:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aMZSPHzmKlp4nB0z4xKj0z3g/eSIybOBv9g3NZ7AxBc=;
 b=GztGmfJYV8tlywo/+a2VFYMkAVdKt7YfBdqaVivbNaR1/K0tqYK9zRBkHsraJk1yMG
 c03G1ZaZOgndjYVpAoBeOHtgim9A0rW+bXNvAHHw93auSDoSLXgdMoFE3CrHZlff5Avt
 A6iR+nzBbTxhu+8HuMMs4NJcv/aFnnsoG+yzPW9ezYPurXkDH0MN/GgD7/TpmSO507rI
 4TPMMdnqvK2Iw2Sr0YjxHsUwZ3oaijXriaQHDLJ7ztwxBNvRddKNe2D176aOJFvu3uR1
 Cr6MlTLq/VE6NI3MxAXCfNFd03OlsedQ+jaewFX+RP9rprU8QLP7lVD49bcEnNXxVGt9
 aYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aMZSPHzmKlp4nB0z4xKj0z3g/eSIybOBv9g3NZ7AxBc=;
 b=jdd1iJWhDnoF6TC8mEPwOr86O+6ka1CeK/y65ZbLq4omy/fRwEzp2qX+3V2h36woxM
 GTr/sE3aH621loZ4xcdoIFR9XSiJpePxgd5kRn3JdJfpsONy5bhnQwRu6q4Caaggdrzi
 CWoFNDeXTPlGR/S4obiVOJzrZL8cQ3z8aE9zYfWMAhH5mf6i5xPcwvz5263jDtSH27mZ
 tm0MbCTO295pVn9aagrm9grhQ0iFg8P+zrCl4Rm82wjDTo0KHVFEyT2Q+q0Wo1NK1v3x
 E5cML3UUaSOP/mDJX8ZV75eYT9jUE6/lXZ4GVsR1khfdkPPT1nUEbjDJa7hSk6+eNBLD
 YJfQ==
X-Gm-Message-State: AOAM533zI+lf+CMoGuh7rl6FAQlWL5Vt4MdcptIIRad+2zZOlumyeDJS
 +pCBR8t2hi8Gl468JEH6z+A=
X-Google-Smtp-Source: ABdhPJye3e8Fd3RuWitjlcsNICFnsTS5SmIxWwZuo312bTG8xiFg9RxZcyL3DnR9MqIFlnZ1jLC75A==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr3390565wmc.58.1639553361731; 
 Tue, 14 Dec 2021 23:29:21 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id n4sm1204728wrc.1.2021.12.14.23.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 23:29:21 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, ikjn@chromium.org,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2] clk: mediatek: Fix memory leaks on probe
Date: Wed, 15 Dec 2021 08:29:15 +0100
Message-Id: <20211215072915.8678-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_232925_086116_563E80F3 
X-CRM114-Status: GOOD (  11.86  )
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
