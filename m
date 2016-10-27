From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
Subject: [PATCH next 1/2] media: mtk-mdp: fix video_device_release argument
Date: Thu, 27 Oct 2016 22:23:24 +0200
Message-ID: <20161027202325.20680-1-vincent.stehle@laposte.net>
References: <1473340146-6598-4-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1473340146-6598-4-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle-QFKgK+z4sOrR7s880joybQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

dmlkZW9fZGV2aWNlX3JlbGVhc2UoKSB0YWtlcyBhIHBvaW50ZXIgdG8gc3RydWN0IHZpZGVvX2Rl
dmljZSBhcyBhcmd1bWVudC4KRml4IHR3byBjYWxsIHNpdGVzIHdoZXJlIHRoZSBhZGRyZXNzIG9m
IHRoZSBwb2ludGVyIGlzIHBhc3NlZCBpbnN0ZWFkLgoKRml4ZXM6IGM4ZWIyZDdlODIwMmZkOWMg
KCJbbWVkaWFdIG1lZGlhOiBBZGQgTWVkaWF0ZWsgTURQIERyaXZlciIpClNpZ25lZC1vZmYtYnk6
IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+CkNjOiBNaW5naHNp
dSBUc2FpIDxtaW5naHNpdS50c2FpQG1lZGlhdGVrLmNvbT4KQ2M6IEhhbnMgVmVya3VpbCA8aGFu
cy52ZXJrdWlsQGNpc2NvLmNvbT4KQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBz
LW9wZW5zb3VyY2UuY29tPgotLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9tdGtf
bWRwX20ybS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9t
dGtfbWRwX20ybS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBfbTJt
LmMKaW5kZXggOWE3NDdlNy4uNGE5ZTNlOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLW1kcC9tdGtfbWRwX20ybS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLW1kcC9tdGtfbWRwX20ybS5jCkBAIC0xMjY3LDEzICsxMjY3LDEzIEBAIGludCBtdGtfbWRw
X3JlZ2lzdGVyX20ybV9kZXZpY2Uoc3RydWN0IG10a19tZHBfZGV2ICptZHApCiBlcnJfdmRldl9y
ZWdpc3RlcjoKIAl2NGwyX20ybV9yZWxlYXNlKG1kcC0+bTJtX2Rldik7CiBlcnJfbTJtX2luaXQ6
Ci0JdmlkZW9fZGV2aWNlX3JlbGVhc2UoJm1kcC0+dmRldik7CisJdmlkZW9fZGV2aWNlX3JlbGVh
c2UobWRwLT52ZGV2KTsKIAogCXJldHVybiByZXQ7CiB9CiAKIHZvaWQgbXRrX21kcF91bnJlZ2lz
dGVyX20ybV9kZXZpY2Uoc3RydWN0IG10a19tZHBfZGV2ICptZHApCiB7Ci0JdmlkZW9fZGV2aWNl
X3JlbGVhc2UoJm1kcC0+dmRldik7CisJdmlkZW9fZGV2aWNlX3JlbGVhc2UobWRwLT52ZGV2KTsK
IAl2NGwyX20ybV9yZWxlYXNlKG1kcC0+bTJtX2Rldik7CiB9Ci0tIAoyLjkuMwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
